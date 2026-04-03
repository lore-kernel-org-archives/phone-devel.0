Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF43438D6BD
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 13:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224526; cv=none; b=ESnH7+Cnz2XYv1X/igd4OtMkHr/WHkA/nF+XTrcj/Xv0oLYe1+lWYOqR4TnvalzgmQA4XO6cSLIcZXF5mRz9LsYUD4WzpYaFsc6Ab8IwLuBNiXi2RI2jHunOMgHCxCA1XXTRrRWaDzijIdlz2Yq1UNOt8Cce35f7O8gvXQtqts8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224526; c=relaxed/simple;
	bh=0tNxjU9iZ5aS9yMEJ2ytUcRE8/Wq0mJ0XVTDTTRdWIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mhbvgx4yVyTSos4Dgl0Lf+dHQEv1C2aZLyJLD5AlZ57AgsoLqaaJgSJDwUaCUpyf20LHgogdtIC/7bS+KIgmssz32oPJJdHpAnw/hrFIIWkzTaHqwPyToxdzHnMBJUPfNYB3Ic5ldg8Sw+JoLeerSNvwWT/hxGnGnXCfYUi3btI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=KrQYnLGJ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="KrQYnLGJ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9c04152730so292108366b.0
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 06:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224520; x=1775829320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUIw5PfzjSbRelAWl0scbWA1aw6NDc9ZPR21LqC1P6U=;
        b=KrQYnLGJl8pxYlKkbPv9GaBQcgH7Y7ofkMb1Pw3P+0GjxqB5fvtUWPGvcZwiAFnCs0
         DuLXU+rRbGOsMHYMSnNB6rrP5f3ztFFAl3iLLx6oSj8/1O9h8eGTIEdHl0B5C4W/Uhm3
         6I27KiVMYAjLJMGvJhYYXHdbw75LlDzYO/zeMbFylWp/9lCJm7owH97i7ZqzFfEPwIPH
         gBa4Z0c30OoUTPGg0ZP0kd5pvVulkGg+lEF26Tfu0ZrPyoCrr9iSCS9oh4DYN01eC77H
         hxDPbYoH0BI0fWsdLzyxKvvugvkw61/i90HJFzPa/Xj527crC33BOwt1A+slwaxsLiE/
         COVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224520; x=1775829320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JUIw5PfzjSbRelAWl0scbWA1aw6NDc9ZPR21LqC1P6U=;
        b=fuRz15YvdWaBKPwAYMb/F87V8/RWvGRJQwUvaJX9vQeXwbxuzTfXW/VUm5ft5hDCel
         ARpbnZFM+4UYiauzIiK2eJAQ2BzgY4gOSMspQA4QvDxTOfSzIq+XqigUysRt+FIb8u9R
         dNrlpbLaPC5d51fHRjl5uugHDew8KoTdEUmlhRXjMG4DUDME+gnoUYGbon0mBXv5qH1c
         MKbW4ibU5gWYPXyjAHsmc7gk+FBEjk0f0qwEXvl5wKksb/JlSDPd6561B56x1PimIOXP
         Y02eJ1JP13oIy0Fqs8Mbqo1BEItm+FjIUjyRu8RlAaHxFPNa/SFrca0hFrCTECKE5u+8
         viUA==
X-Forwarded-Encrypted: i=1; AJvYcCWSng+gNm+9X3bsJMx/jsMO88kjk2OpTRarzh+Kf/3mtd024moOqaNn9Pk3sMZSb5jtUyPwcVtF+0bsyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQWbK7/5O2wHKNbTlKBskCpEi2K/ksO8zLdJ5daqbelveEi9zd
	jul/0+Y3t+XgBIKMnhTnxSiuPaX04W/DPZAFZh43481V395Il87kjiV7N+Jb28RUsdk=
X-Gm-Gg: AeBDies8obh3k63ESR17dhzltT7WZwmGkrHXgxNJTt1GaEfkrZYMOVMk4YEBCdvznzL
	iYYf/LYD4mqglOOFqpSTRk7dC2XDX9lJp2kOs7+fECVTUnGQbdLjh9ldjAuBfF9c60UsmFSEU09
	K+F6FDWS95OPbVfpH4KiS1IDKbYllUBIwHExP0MBe+LHviEb+oZJxUexrD3mmpUktj9/dL6aLte
	CX+D2JORvAAp6TM0vrJ3UHopPuT9Yhbhzree/7KO64e+ftnpcvW/plt6OFvyWbrnVYFmtPqI+ye
	AZQlMznR1U4cUGGRCTmaetK8zz3NhthmdugG+NSlZYrrtMNRHZtd2z9AZLBxH4dfQWpzIf5+8yX
	6+9XYkiu+ysxEPE2VWo+AKigdnINxPZWKxjIp8eGLsWIc1nZ335ZsYEIydfuWFLAZS5BbfXpKiK
	wc5U4Hsy6IKpMZED6d08EJpk6wlvl7eDIweeGC9+7c9svEy3NhydxOWE2AiLPBFA+tRNXVLzuet
	7+6P3/rxV+FYPT/ZHJoW14UNSfzjFnIZwBWXg==
X-Received: by 2002:a17:907:9711:b0:b96:e593:fd1e with SMTP id a640c23a62f3a-b9c66e5e2cemr156799566b.0.1775224520390;
        Fri, 03 Apr 2026 06:55:20 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:20 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:50 +0200
Subject: [PATCH v2 4/7] arm64: dts: qcom: milos: Split up uart11 pinctrl
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-4-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1487;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=0tNxjU9iZ5aS9yMEJ2ytUcRE8/Wq0mJ0XVTDTTRdWIM=;
 b=/YToNUqYXJRAKqxJIRr0r/cZTobsLFymsg/TVbH46bVWMTHSJdm7XRvdUpgk256TWrcMjxZzR
 nOrivC7LfVFCc3S9aQe2Xi11CK1Ror8u934bOVKDYcB1HNT8BXOHYGt
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

In order to set the pinctrl for the individual CTS, RTS, TX and RX pins,
split up the pinctrl configuration into 4 nodes so that boards can set
some properties separately.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..71292dfd6e08 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -2099,19 +2099,27 @@ qup_i2c7_data_clk: qup-i2c7-data-clk-state {
 			};
 
 			qup_uart11_cts_rts: qup-uart11-cts-rts-state {
-				/* CTS, RTS */
-				pins = "gpio48", "gpio49";
-				function = "qup1_se4";
-				drive-strength = <2>;
-				bias-pull-down;
+				qup_uart11_cts: cts-pins {
+					pins = "gpio48";
+					function = "qup1_se4";
+				};
+
+				qup_uart11_rts: rts-pins {
+					pins = "gpio49";
+					function = "qup1_se4";
+				};
 			};
 
 			qup_uart11_default: qup-uart11-default-state {
-				/* TX, RX */
-				pins = "gpio50", "gpio51";
-				function = "qup1_se4";
-				drive-strength = <2>;
-				bias-pull-up;
+				qup_uart11_tx: tx-pins {
+					pins = "gpio50";
+					function = "qup1_se4";
+				};
+
+				qup_uart11_rx: rx-pins {
+					pins = "gpio51";
+					function = "qup1_se4";
+				};
 			};
 
 			sdc2_default: sdc2-default-state {

-- 
2.53.0

