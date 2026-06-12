Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2733DD86A
	for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 12:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268770; cv=none; b=UQLobn3nUyxwgB6ryH3wAI3JMzpBIy4QSqkLFwVWmP7Wuf4Mz/WU7C+OMHJwjKbqUWcJAWLjMce17l228lgBcPt/suIAAdHsgP52uvz3Nk0fm+xVhuplDZuE5fPZ+IGjDOTOwjeCOqZwRx+lOJgfh4LDSiaf+L0ctkXqy6jzk4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268770; c=relaxed/simple;
	bh=+gJoHyGsiFiNaIlHB7RgSHLds74RlNXffkN/maQntfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XVUoheRawgTTXnmIhYew0oGgNrQV3UP0483h7djyJ/ILn2YPXYuY40MEMLRvUPq9NS5yUhO3o4zWN9uQ5Ea3pGocY4I1vmP2N05bEZsD5FVcScORsG7zgky0X8YP8bocZbNuz0GOjmSzelIQEsZgBKTN8ZckOK/ph0B7Akyiv8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cuwJq4We; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cuwJq4We"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bec423a5265so178191966b.1
        for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 05:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1781268765; x=1781873565; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q6boKDQpN4ENAhHPbAvIJHcNbXUFoJdy37O/+JGrt8U=;
        b=cuwJq4Weasr8kyaVwhIvSaJh6R+L9O/J6VUXnnI/TFRmx6LrfnOptNtc9HQTWanNU3
         UV3TUbSUEqjDsqksJUkA1dyUIq3fOPcWx0MGFWRzTMxXVZNRbk1JfGxDc2EDCA9AlQY3
         wmHcDXo8/UEUFmTTfnrlC+TwPMzRtjcRIpbs173p/tbCVN+6EZJYG4C+K6zRF+8wUZvW
         nIavBcrgLP5lWYIIN/VWOE1AkcrC37TObuqV2WgfH3lNjrKfQ3RP20fngCXYfnynS1uq
         l2TknREudIdCZEaIpz8/BwIDttpuO2Z9f19pOOSmCfRbiMPfqqwt2qaHmaTsL04jUB54
         0yHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781268765; x=1781873565;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6boKDQpN4ENAhHPbAvIJHcNbXUFoJdy37O/+JGrt8U=;
        b=e7EV+ep1B+VRS5xKfb/Go65LV+yDifq/izE+5NK3EzSNrKzh8CnlCxDvyT4sxMlw7/
         Fbj3+X5cO2zaDrPBL6q5Jg35vUoRL0Z2RfyLUhKnkwHXzaBESNBxC+OraF0WLWBmzPHF
         LQ5AQUo19tLTQ8XhTVcFcIuET6sV13ZP4qZdeuzCOGFWuZ2FCwXGhgnPThQTbNvAtRPH
         OAUC38y3C+nS/icES8XOBwbET9kCKVSQEdUK+RHd0nHtm1iPIY4qoFitjl8rC8z5JL7O
         xH9NQSk5wwZeG5ti2gTwamvJaCE6+G5HH6TAlB23B6W+0fZmJ065XM89+UtcgiyLmCig
         8P9A==
X-Forwarded-Encrypted: i=1; AFNElJ+hD+EqXsi8abiyohZmV/JNTdpLYxRRBr49OWDEuztCYNg2+7pfiqNQi9WjcyY6m7WvudsR43ZJuO2ZQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwV8nBMvs6NzoxaffdeZOhWYifOAoIBqNLWMNi3d0dzEILr/F9J
	du9n5CX9vxpk9nwwZxglGdgZyoad7zwDUtsxx2AjInOQttM6uZlIImd2fB+beUtWuTs=
X-Gm-Gg: Acq92OFS4XU6FxZUdB5BrGYE//5elHCuidH8XOASs9qP2GrhcfSRO1xXJmN1Y1YjT/O
	TuBvDQjWQW3axhSMCHlRctWaXIYEQc3t4Kb4n/GYK4x3jg6WSoIxt/r4HMY1SnSXywYodDm5thR
	Yyt90hvyww3G/I7jGuZnGG1R7jyWjKBjzLWbDBR68nBO8LQGwtrmQsqQ5brQgQiv1brcaNg2hhH
	e1ijvhfSSN39VMlz8Fb4IO/qG8U5wSZRtPMIF5mt6aCp7sgVD1T7RBNOKn0LTtqgJdmZwB61KCJ
	DTZkzdWys6eGWQWUnNfRZV4IYRMG9dUPmaAo9invUcYHKZLUKutkiXPu8uf/q9+f8WTQFCtVTaY
	LlvzH7gIBC/FfzR6f6jj6sLIsWQ7fCpHYWseqffE3bFrPzdiWNtpvCAmZRSWs0KGbBk3KUvQOHo
	T8Y9P1omBpqhskJG2FXY9kWvl3SmVGLqhWATgUlb/3QZvyJCl5uNQtW2hkAK+5x8VU26tdbUxt7
	GEEFONLMevbdGAgcqRNyxXYT2HwiDOhpSzj8OYXbJ28Gyj6fQK154Bo74Q=
X-Received: by 2002:a17:906:4794:b0:bed:a213:a89b with SMTP id a640c23a62f3a-bfe2b0f8f54mr142133466b.37.1781268765453;
        Fri, 12 Jun 2026 05:52:45 -0700 (PDT)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-b4d0-bc9f-f60e-913a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:b4d0:bc9f:f60e:913a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm57823066b.1.2026.06.12.05.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 05:52:45 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 12 Jun 2026 14:52:43 +0200
Subject: [PATCH v2] arm64: dts: qcom: qcm6490-fairphone-fp5: Add AW88261
 amplifiers
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-fp5-aw88261-v2-1-f7ef7d060170@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OQQ6CMBREr0L+2hralIquvIdh0daP1IQW24IYw
 t0txaXLSea9mQUCeoMBLsUCHicTjLMpsEMBupP2gcTcUwZWMlFWjJF2qIh81zUTlMiSKVUiV+J
 8gkQMHlszZ9ut2XMY1RN13BS/hsfXmGbiXgMlAxLt+t7ES2FxjiRPCUphU3QmROc/+d9EM/H3y
 kQJTSRyylBxzfHaSuOHzlk8Jjs067p+AdXc6g3tAAAA
X-Change-ID: 20260522-fp5-aw88261-a02bb0e4b697
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Val Packett <val@packett.cool>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781268764; l=2873;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=+gJoHyGsiFiNaIlHB7RgSHLds74RlNXffkN/maQntfI=;
 b=5ftPVdQT3awobwhdIKpoO8iBgTIf1JN92Puc7p1+tF6/AWKV+9xg1A4MGMO8NQVwuWmKAqkc0
 NzuiKq3ds/GDe/tNM5BeoXHNWRhS0S1ykKsWEiIsRWgqoFfm2xmAJRE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add nodes for the two AW88261 amplifiers, for the top and bottom
speakers of this phone. Hook them up to the sound card.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Signed-off-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Remove awinic,sync-flag for both amps since it's actually not needed
  (Bhushan, off-list)
- Remove RFC prefix
- Pick up tags
- Link to v1: https://patch.msgid.link/20260522-fp5-aw88261-v1-1-20e412eb4c4e@fairphone.com
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 57 +++++++++++++++++++++-
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 04cb9230d29f..6ed34b5a99b6 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -866,8 +866,33 @@ vibrator@5a {
 &i2c2 {
 	status = "okay";
 
-	/* AW88261FCR amplifier @ 34 */
-	/* AW88261FCR amplifier @ 35 */
+	/* Top speaker / ear speaker */
+	aw88261_l: audio-codec@34 {
+		compatible = "awinic,aw88261";
+		reg = <0x34>;
+
+		dvdd-supply = <&vreg_l18b>;
+		sound-name-prefix = "Amplifier L";
+		firmware-name = "qcom/qcm6490/fairphone5/aw88261_acf.bin";
+
+		awinic,audio-channel = <0>;
+
+		#sound-dai-cells = <0>;
+	};
+
+	/* Bottom speaker */
+	aw88261_r: audio-codec@35 {
+		compatible = "awinic,aw88261";
+		reg = <0x35>;
+
+		dvdd-supply = <&vreg_l18b>;
+		sound-name-prefix = "Amplifier R";
+		firmware-name = "qcom/qcm6490/fairphone5/aw88261_acf.bin";
+
+		awinic,audio-channel = <1>;
+
+		#sound-dai-cells = <0>;
+	};
 };
 
 &i2c4 {
@@ -1161,6 +1186,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&q6afedai {
+	dai@127 {
+		reg = <QUINARY_MI2S_RX>;
+		qcom,sd-lines = <0>;
+	};
+};
+
 &qup_spi13_cs {
 	drive-strength = <6>;
 	bias-disable;
@@ -1238,6 +1270,11 @@ &sound {
 	compatible = "fairphone,fp5-sndcard";
 	model = "Fairphone 5";
 
+	pinctrl-0 = <&lpass_i2s1_active>;
+	pinctrl-1 = <&lpass_i2s1_sleep>;
+	pinctrl-names = "default",
+			"sleep";
+
 	mm1-dai-link {
 		link-name = "MultiMedia1";
 
@@ -1246,6 +1283,22 @@ cpu {
 		};
 	};
 
+	i2s-dai-link {
+		link-name = "Quinary MI2S Playback";
+
+		codec {
+			sound-dai = <&aw88261_l>, <&aw88261_r>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai QUINARY_MI2S_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+
 	displayport-rx-dai-link {
 		link-name = "DisplayPort Playback";
 

---
base-commit: e7b907ffb2cd66314df92360e41f7bd5fdaa8182
change-id: 20260522-fp5-aw88261-a02bb0e4b697

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

