Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682E82D9ECB;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775452619; cv=none; b=euHNDNxJGcvnXtBhTUJJwaihn8MCNbzx1bIXj65OuyrOGY/g1yuM2JQTN7XHoSp/qFVzM0ul+kS45iOM9JqX6zWU2GmE9655t89YLsxKOZ+YNBPBGzNh4UnvHpqmZ21dPaFVCNsv96KTFZoEebkHKqroWFdgXE6JA2WYprlvfDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775452619; c=relaxed/simple;
	bh=diflTiFOAqcvYf3crqey6uaDb/lDhFF77VdlL8dJwh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mkavE3If0uM+syz60h0XZQr5Vna5xaNc09sE9lHffaD/XGcGTmdB3A4xZrAZJFqTsQ8B0BIFaeL0s8vLzS1b3LEvhmk/AabxwDAg8Q/i2iaZD1pTThfdgKgCtvNpFuYcmfUzKVRMw0HudwvSfWR7Md3pVQM9F2cofEVgOJGQHx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tydBbXyN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tydBbXyN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27305C4AF11;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775452619;
	bh=diflTiFOAqcvYf3crqey6uaDb/lDhFF77VdlL8dJwh0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tydBbXyNhHRsQlT+UoWjS4c4ZsjuYKsADuemDDlvtg3uycQRNYV8C6L23UZ1Uq74D
	 oK965UOWaaLK+Kxae/QZrXVH86NB8EaDK36IGLY7bB7UHo1AKDue7fjE7/ScJMyslS
	 Tis5+ch3xgQfs1kqEpOalErzvZD5KKGp5TNgxPnBPCaf2kz6NhYsqPr4tM1dQqY/Fq
	 K9uISVtkIDeGwpu7Zp4oiyE/xIzu6Wnmw8gpJnC7up8Qsa6WWPE37iGIfU1Jr56Pps
	 qbz8qxmg+Vq+ApFy6J4HY7KlPfdZUr3Gb2IIObmouGxK1IcyQWnzPM9HoSsxgmnqBX
	 DNFq2jcxRMT5Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F48AE9D818;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Date: Mon, 06 Apr 2026 01:17:00 -0400
Subject: [PATCH v2 4/4] ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-m8-dts-additions-v2-4-c4c4bd50af48@me.ssier.org>
References: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
In-Reply-To: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Messier <alex@me.ssier.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775452618; l=1510;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=A5B+vqZ179ZaDPlA3FT17LpryB1RKmK0Cto2Yde+kzY=;
 b=XFv28L9PjBz5gSbfK4yWi2aPoBQ1/kpYHiDEUwKx6u1z4TCJiy+e/YO806jiJrDus5Qvnkm1R
 s4N3BEMGiUtAYb1RCQKiqyBKCrtCw7pDynzRajt3cZUG4kNZgNIpTOe
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
Reply-To: alex@me.ssier.org

From: Alexandre Messier <alex@me.ssier.org>

Add the touchscreen device node for the HTC One (M8).

The downstream vendor kernel used an I2C frequency of 384 kHz
for this bus. Use the same value as the vendor.

Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
index 2edf407db567..66ad93e7dd20 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
@@ -65,6 +65,35 @@ vreg_vph_pwr: vreg-vph-pwr {
 	};
 };
 
+&blsp1_i2c2 {
+	clock-frequency = <384000>;
+
+	status = "okay";
+
+	touch@20 {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x20>;
+
+		interrupts-extended = <&tlmm 18 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&ts_int_pin>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rmi4-f01@1 {
+			reg = <0x1>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f11@11 {
+			reg = <0x11>;
+			syna,sensor-type = <1>;
+		};
+	};
+};
+
 &blsp1_i2c3 {
 	clock-frequency = <384000>;
 
@@ -353,6 +382,13 @@ cmd-data-pins {
 		};
 	};
 
+	ts_int_pin: ts-int-pin-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	wcnss_pin_a: wcnss-pin-active-state {
 		bt-pins {
 			pins = "gpio35", "gpio43", "gpio44";

-- 
2.53.0


