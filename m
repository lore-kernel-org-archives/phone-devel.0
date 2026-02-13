Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810B2360728
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 14:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991407; cv=none; b=ByqaKsJMTuJ5+l0s7CjYpoE4qSYNMPVJmoQwwnuo06gzaAp2ZlMZyquJD+D2F1R6DAY07Wo02rVHxqzSlFuLJB7ekKTvmJt4+uPSohqtupTK5kjW6A9wfJ0tBLnZKtQF8RAjSGBGM3oWxZIDOVFIFXVEp1PDzQdgWGtRYc0MpLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991407; c=relaxed/simple;
	bh=qvo65LanDuFCYnaQEMETeuJDl8/hedGAhke9jmb4ij0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fjuKfjXd+c17yfsAFCF0AfqtAabRnYq9zlvVVHteisdPZDw2Y1XhjBV7zFpNgw785RrJQmZWg9w9uhNsgHEeiMperDCA+s4aKkvkLPm/mdz1sgPjwPmoT51G914mxKocPj5IPR7iRLeO071gfrf/c021O/deqqKYxIKBVodqAJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SgLXUf4y; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SgLXUf4y"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65baa72399fso1152883a12.0
        for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 06:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770991404; x=1771596204; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9NrnMRzX4XXiYKxcnmtwGCiL15AjGDqwpnUtoWnjVhk=;
        b=SgLXUf4ymhs96XROJHIlGuHf89cyWwEcctsoZMvcp0fsqWnW//EbbL7rKrVm4UlANz
         4AWOZ9JgFSTXNLKxfA60JFB0sQChipSSnbyjf9gvfcHaoYHNhlCfC9eiAO6x9IP97QA5
         H8kwDVoyVj42GyRP8zOXS7vqqKXSEHSEYSNw+uOKWO8WTuHiFAbGSaeAg0Jq4CfEoeXY
         4uM1DXStrNLLcFq2EI6fIY05a1WS6lh8uhYFImdUImd9lnsn6Z+X07hd0lTcE1rtowiy
         Rnh0OmMUVoqVOMsyVFfBM8JsKL1Uvq6USvwFm8XV5icFyORWJtNrrP6F3XTEuVZmqFXF
         ARZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770991404; x=1771596204;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NrnMRzX4XXiYKxcnmtwGCiL15AjGDqwpnUtoWnjVhk=;
        b=C95ux/WcNkgrznU7SYDC6Au8pc+8nwa4smdIX14+BP2g0IfcjSxatD0VX0WiiF7+eP
         /YEzfbuaf/DJM100X45z4sdBG4kq9dClCPfRBw5KD5VwV/PEx6DIdCGfKEmCvs352sbp
         ptOs6lqQIbNwZ8UZMkisYOTm4v4GarpdxINQwIY4e3ChffQPTBcoA47k3M84D/C9LYf2
         pCwsnQva2V7khbWysRt7AhDpxJLnjhsGrqMUeF6+OtwAPCRxcSZwRrkkD0+Z8Z6IBA9z
         byQxgrNjfWQP+VI9xPFWWpLXCTzoM9gPo1dTtmDS2skhqa+PeZKVMVmDvICtRehEjCY6
         KF8w==
X-Forwarded-Encrypted: i=1; AJvYcCXlqWaxG4ILUTiyfibv4mwVTqtG4pv2LhPttWZB8aHdf0sx2B7qfzOlPejYW0jKBxdNQzEAPX5SoApngw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaaUsIdjJx6DrVUuarpEj2jm0T04hAJulruLKk+YT/wKwJBvvn
	zXlNeSbKZCenc9yYapSsojY6OK8GGNhud9lMxftmBVZe/o4lnCofIvM6/4Sax59IIP0=
X-Gm-Gg: AZuq6aItTfx5feqrXs2kTrtMvalISIMPlM6S0Vg56/HJXrGgF305Y5zdZ12WiZl4HCr
	rh03R33/uDamAY2vz6pFIXUJBDNMky0kwRFXirnYpHIm6pJ9LsCDqD0eqUIg4K1yDGWOWyI0myC
	3SBuKlyvh1q+WF8L7nRPJWYdhgayjesbhlQVp6auBRJXeqHU2B3m7nKDHpoAFPV5ngkv+ZFoTLt
	sJdQqykNVNuIXMshF93ra4EK1DPSEdlZdMElr0hLozVPbVSqrXziPVOCChBI+fgGa3t0BMps3BR
	b+sWbiXpMwzhsXbJOQDDr9v12gB+g5lnVCLBqn5uVaoH5C7DhN2tuY7kG5zjlQKTVvlCdx/QSCw
	ry1KBoWZxDa2zJJn2OBSGvM5gw3yMltyumlTe5zM0E/9yNklp3GxE6VP7KaeWPAN3L0whPa9x1k
	ftLftwv+k5Guv139GuJlvT2taClA5HFe5e+4Sf/t8HUOXpQjWHctqqBHiYi/LA8DlKZ1RqAkaFl
	zI+
X-Received: by 2002:a05:6402:2346:b0:659:5c6b:d280 with SMTP id 4fb4d7f45d1cf-65bb115f66amr1018995a12.10.1770991403813;
        Fri, 13 Feb 2026 06:03:23 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad19be01sm707871a12.3.2026.02.13.06.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 06:03:23 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Feb 2026 15:03:19 +0100
Subject: [PATCH] arm64: dts: qcom: milos: Sort pinctrl subnodes by pins
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-milos-pinctrl-sort-v1-1-799bae597074@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y3MQQrCMBCF4auUWTuQROyiV5Eu0mSqA01SZ6IUS
 u9usC7/B+/bQUmYFIZuB6EPK5fcwl46CE+fH4QcW4MzrjfOXjHxUhRXzqHKglqkou0pmjlON08
 R2nEVmnn7offxbKHXu9n1HGHyShhKSlyHLtNW8e87GI/jC9lSTRqVAAAA
X-Change-ID: 20260213-milos-pinctrl-sort-16ed0fdb5aed
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991402; l=2900;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=qvo65LanDuFCYnaQEMETeuJDl8/hedGAhke9jmb4ij0=;
 b=CZBNY190SsVciKMMaB0LgDyiYrPLUhYHCWmPpxFYJydne8wUcptpquNJ8SNjVryR8dx6hHrWi
 gspQjrVZmTeAhd6arReTleNLWH5C4PgXZb0T30ziCk9onILE4tdywtT
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

As documented in the "Devicetree Sources (DTS) Coding Style" document,
pinctrl subnodes should be sorted by the pins property. Do this once for
milos.dtsi so that future additions can be added at the right places.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 54 ++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index e1a51d43943f..bd9a11ea703d 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1667,6 +1667,21 @@ tlmm: pinctrl@f100000 {
 
 			wakeup-parent = <&pdc>;
 
+			qup_spi0_data_clk: qup-spi0-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio0", "gpio1", "gpio2";
+				function = "qup0_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi0_cs: qup-spi0-cs-state {
+				pins = "gpio3";
+				function = "qup0_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio4", "gpio5";
@@ -1683,29 +1698,6 @@ qup_i2c3_data_clk: qup-i2c3-data-clk-state {
 				bias-pull-up = <2200>;
 			};
 
-			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
-				/* SDA, SCL */
-				pins = "gpio32", "gpio33";
-				function = "qup1_se0";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_spi0_cs: qup-spi0-cs-state {
-				pins = "gpio3";
-				function = "qup0_se0";
-				drive-strength = <6>;
-				bias-disable;
-			};
-
-			qup_spi0_data_clk: qup-spi0-data-clk-state {
-				/* MISO, MOSI, CLK */
-				pins = "gpio0", "gpio1", "gpio2";
-				function = "qup0_se0";
-				drive-strength = <6>;
-				bias-disable;
-			};
-
 			qup_uart5_default: qup-uart5-default-state {
 				/* TX, RX */
 				pins = "gpio25", "gpio26";
@@ -1714,10 +1706,10 @@ qup_uart5_default: qup-uart5-default-state {
 				bias-disable;
 			};
 
-			qup_uart11_default: qup-uart11-default-state {
-				/* TX, RX */
-				pins = "gpio50", "gpio51";
-				function = "qup1_se4";
+			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio32", "gpio33";
+				function = "qup1_se0";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
@@ -1730,6 +1722,14 @@ qup_uart11_cts_rts: qup-uart11-cts-rts-state {
 				bias-pull-down;
 			};
 
+			qup_uart11_default: qup-uart11-default-state {
+				/* TX, RX */
+				pins = "gpio50", "gpio51";
+				function = "qup1_se4";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			sdc2_default: sdc2-default-state {
 				clk-pins {
 					pins = "gpio62";

---
base-commit: 3daf23347bb5f4a375d0101ed29c97ce1a99721b
change-id: 20260213-milos-pinctrl-sort-16ed0fdb5aed

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

