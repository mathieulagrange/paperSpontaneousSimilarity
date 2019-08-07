fig = openfig('../paper/figures/frame.fig');

y_sc_euc = fig.CurrentAxes.Children(1).YData;
y_sc_lmnn = fig.CurrentAxes.Children(2).YData;
y_mfcc_euc = fig.CurrentAxes.Children(4).YData;
y_mfcc_lmnn = fig.CurrentAxes.Children(5).YData;

Y = cat(1, y_sc_lmnn, y_sc_euc, y_mfcc_lmnn, y_mfcc_euc);

T_ms = log2([25, 128, 250, 500, 1000]);

%%

fig2 = figure(2);
set(fig2, 'WindowStyle', 'docked');
hold on
plot(T_ms, Y, '-o', 'LineWidth', 2.0);
hold off

ylim([82, 100]);
xticks(log2([25, 50, 100, 250, 500, 1000]))
xticklabels([25, 50, 100, 250, 500, 1000]);
xlim([log2(25), log2(1000)]);

legend([
    "Scattering + Learning", "Scattering", "MFCC + Learning", "MFCC"
 ]);

xlabel("Context size (milliseconds)")
ylabel("Precision (%)")

grid()

savefig("cogmir_precisions.fig");