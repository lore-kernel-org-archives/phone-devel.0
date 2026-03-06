Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0CB3AE708
	for <phone-devel@vger.kernel.org>; Fri,  6 Mar 2026 14:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806952; cv=none; b=sKVbKT3PfbbuXR14LIUSgrQLVkAW2OBBxH6TUnJz/UOkhzYhRS/9VhAXJCZvzfD1fJcE9z1JSaHJ89mjsKjUrlMESwetwKR8pRcMyeYuCA0SGz5rWlsvMAGsZHFHRHRMksXcUSGjvTiwFNCH2fZa7DwYpxBD7tx8QjzBrxAtOTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806952; c=relaxed/simple;
	bh=ceaAYHgyAOISMMGiY+fNNjyu+n4n2FiUVw5y5npeShc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kEyTB4gqoiYVscuef5QRiGbBALiJ+9+5PrnHOM+lq7WgVOGvm45SpN4H2jarWT3iolI/CHUb4gNtW+qNRqP3OKNjh0bKgpFUCuXGv9gwLOiEFPiHRrZcpzaTQQrutGUvP40GvjSBWaL2sfdtu1GL+SoQSlyOcaSYHRooyQgYsD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=WHNDsM3+; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="WHNDsM3+"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-660d77cacc2so944983a12.1
        for <phone-devel@vger.kernel.org>; Fri, 06 Mar 2026 06:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772806944; x=1773411744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uGmjUwMwFnjrFzi7s2tWi4x0D5mNfrprS2P1mjJOIk=;
        b=WHNDsM3+QmKHSbTDx0Gyh7iSjnMW1ZDCaCQnV+FWwU3rqvxsWJxDpdBt2ryqaGMaKl
         RUuNY1Ee3L1snaoAA6Sy9LEXS68zDQMVa69JPkTNg4CUxSMIwNMgLAiShmUbg1sXKVxJ
         06iyUqGvtPvYLL5u8WZ2knvvfEYcnFXAB4+Toj91mvuAMSiITRZNKj//koILnYvhT8LV
         Yp7xNZ+4cS3LJ+E21kjDZtHjUQ318Z5xPgPithD4hW0MNHF4jXs8V7+WJCSc8uiLQttl
         vs0TpqaC8O3gNv6E/RoJN/gQZKpXGf0O64Nl0Ud24LNjy8rc0irW/nglYgXVl8FHZrh5
         uDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806944; x=1773411744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+uGmjUwMwFnjrFzi7s2tWi4x0D5mNfrprS2P1mjJOIk=;
        b=tWiNTPthIfUR1hRe8oOn/z0mq7kATumxtDhroTLQI2z2NzL9/TJlu0VFw/cH3gV8F5
         tgFtM8V8TRVZPsToUqm+FdLgp7sWDETUtLm+V06cEnKIWE0pYOal9hB9PSlCYY8XukoS
         tYJsstOTE55Rh8ZiGO6l8nvGY65yU15IVNMYZ4tKKEz1MactRBAxTW63xyhDqGXhQjjJ
         QJKEWRkX07HPJwputa2g40XyAMSDw8zn/kL4eO9UND3VEPuVPTbTU2zZ+YUccXGpHal0
         76YS5s5/6HRH0m3DnG6YUd2USXgbJUP4L26dBvM/tbETWhLFG27dVX/hO4R7u32OdLvW
         kq4g==
X-Forwarded-Encrypted: i=1; AJvYcCVm+Oro+2qPvZIs4vFxe3b9ke2Hvh9CakhvIYMLFulCJg5e0L8P4znZLbiTeSApTd6Y4fLc+6uJOFLTHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykUc1WSj3IEe2d/HJMHNY9NtVtEO0aYy7Qqs9PBB97U+fUsbJ4
	rppWvGDMu29U5eaUWv0RsHOkk+rUXx0zf7Z51gmu7i4y9EEieTM34yLkwUVrjhvQdfgPu5riCUX
	Dh72c
X-Gm-Gg: ATEYQzxWIgGjNZNHHMX4fdeCsVMGMRz4cwNqttiKzC3ItB0jJ+c4su8M6+PvLslH45l
	uDW7xI7tn/b7j/KNTI2EGyJGWMCnYeh9C+mF0BxnSl6MXURd2wOLsfEnA2xUtl84PoPeOFfkhYW
	iyV19Dwb38Ip7jMPS+NnsmoT69eXLFxaocgvl8gxKxWZ+m4+2TOsXVn58ymrtsIJxSPMnK7imSP
	S0aZiI431txbS1Ix8qPS/mgISrrJfwCoFl3z9oK/T/0jGbZ4jXFOro0PxMLVmb2J/dk7rHqjKjw
	oepKJRFNQk/n+XNdrDshEYrhHoZhTPuMu3moMRRFV+M2MjmRa7k5f4XvkEtujMA9dUnWC++7AG9
	oHsyXKTy0J/rlNgX4nkjwYSSt/DPVGUE/ibnkWIfZUgqxFnaNhf+xXii2wLd12QzV9Ls/kddsiW
	vslXPcCM2C+chkkCShSedJFfx1qMy5CHwO6ed3+yX+y1MkkJPJt82VaWqc6xV5CbFqVMHlAQGvr
	qtI
X-Received: by 2002:aa7:d350:0:b0:659:9068:9786 with SMTP id 4fb4d7f45d1cf-66143049299mr2529371a12.10.1772806944337;
        Fri, 06 Mar 2026 06:22:24 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66d3fsm517251a12.2.2026.03.06.06.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:22:23 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 06 Mar 2026 15:22:18 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: milos: Add LPASS LPI pinctrl node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-milos-pinctrl-lpi-v1-4-086946dbb855@fairphone.com>
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772806937; l=3258;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ceaAYHgyAOISMMGiY+fNNjyu+n4n2FiUVw5y5npeShc=;
 b=GKmNcNAkRbQfG9aIk8UKVimfr43zZminilltWJfAq60uRDyaLQCYTurQFUFAZ/rd1Zn5kpKRx
 ZKw1JGCcpTQCprIzBCXF+ID3isfIfFpuM+JN4GEenepgDNXXo3kK3Gx
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the LPASS LPI pinctrl found on the Milos SoC and define a
few pinctrl states that will be used in the future.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 103 ++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 5691eb2dcfd0..ccacf8d14ae8 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -20,6 +20,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -1307,6 +1308,108 @@ q6prmcc: clock-controller {
 			};
 		};
 
+		lpass_tlmm: pinctrl@3440000 {
+			compatible = "qcom,milos-lpass-lpi-pinctrl";
+			reg = <0x0 0x03440000 0x0 0x20000>,
+			      <0x0 0x034d0000 0x0 0x10000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 23>;
+
+			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core",
+				      "audio";
+
+			tx_swr_active: tx-swr-active-state {
+				clk-pins {
+					pins = "gpio0";
+					function = "swr_tx_clk";
+					drive-strength = <4>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio1", "gpio2", "gpio14";
+					function = "swr_tx_data";
+					drive-strength = <4>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			rx_swr_active: rx-swr-active-state {
+				clk-pins {
+					pins = "gpio3";
+					function = "swr_rx_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio4", "gpio5";
+					function = "swr_rx_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			lpi_i2s2_active: lpi-i2s2-active-state {
+				clk-pins {
+					pins = "gpio10";
+					function = "i2s2_clk";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				ws-pins {
+					pins = "gpio11";
+					function = "i2s2_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio12", "gpio13";
+					function = "i2s2_data";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			lpi_i2s2_sleep: lpi-i2s2-sleep-state {
+				clk-pins {
+					pins = "gpio10";
+					function = "i2s2_clk";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				ws-pins {
+					pins = "gpio11";
+					function = "i2s2_ws";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				data-pins {
+					pins = "gpio12", "gpio13";
+					function = "i2s2_data";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+			};
+		};
+
 		lpass_ag_noc: interconnect@3c40000 {
 			compatible = "qcom,milos-lpass-ag-noc";
 			reg = <0x0 0x03c40000 0x0 0x17200>;

-- 
2.53.0

