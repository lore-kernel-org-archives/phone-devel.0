Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DB54E1C8E
	for <phone-devel@vger.kernel.org>; Fri, 18 Sep 2026 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742417; cv=none; b=lorvgUc2GO81poQkaDSS+I0NjHh41V5oQAd8Os1CV7RJxuCGKrrNtPxkZSk2vwwDgRVWYg73mue0g/itOy06bG/ZZedlKanasPuSdr6LuVHScRtdMfW3FxfgMMO7Fnk8EMPVfKzE3rKiDUfI8pcxt3r7Nw4B6f07rtwDnYu9Gso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742417; c=relaxed/simple;
	bh=rOIM11VEoZADWcbRxJB4CDrlUSZEECHpM7XwHlAs5pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AZmJCpFclX6oNTNZQP+/q2ZIHzSQn8MuRrb5XzUvZHKkRZK+IcYyX8+L/cAHT2TSdaJCNcPyUhxEyZoR8CVCuUlJ22CUFrdufTMikC/vfZXRkdiQlM7LWd9wWeccKis+HWxIkYNYC4NZzgDDgwkUdl9CkbCMfpmvWSMh0AD+Kzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Vzgj1t6x; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Vzgj1t6x"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbeso98873666b.0
        for <phone-devel@vger.kernel.org>; Fri, 18 Sep 2026 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789742412; x=1790347212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBZrkz/d6rH1GgwzTo9HcGaBMgfKERMXTNzWP9DGQww=;
        b=Vzgj1t6x8FL4ln8WwHGb/Q/IiWoBBf+kmxcOymBK4REczICcZv+QjAdoA5QkiXY704
         W19GFz4e7hB7ENn4N+gw6nEUvxzEd6qNemw0SjADVT+mbEowFI2ohvdKs7geEN6vLWZq
         d6NgngTjPzRaoA67Ig1iLWFh6pCJTjxoY/GhKpaHp7kLliUQd/Eh9mq/w02+xHadFELn
         6lz6+77kwna4WDXbVzjMhIxHtoLf5EvJTl3sDFGzGA9GpUhPOGrbrbsxt+BR8J1EI7rP
         gvkkWGX8N0sre9Rw3YoOlyPh7tuiUyiQGXW2MwROsYevvjJLwYEJSnW2sElzIKropJzO
         Eq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742412; x=1790347212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DBZrkz/d6rH1GgwzTo9HcGaBMgfKERMXTNzWP9DGQww=;
        b=p+Sc7xzQAq3ODKo/EYV0v8IGOu4ni50AO1RJn5ElkhkZ6P5u9BhvCMHubOY9vlxxoW
         ENDoPm9slmr5ryc7tBmEVAtB2PN70glinPHpRi1tCWTmeC/3UV9RIhZ6BwaoFGq4kjAS
         22a+R/JtKR7SSlm9hyajr3RhkApN2Cddq3QoQnNfULX2Ebc0Ko9IMIFbPoGwQ/gfhzVY
         TjGfrDWQf0/XTDZAyxHXxX22bO9/f9tLBb5xi8njALoTXcoKW0jMKYGLgVUWrwyjScEN
         GYwawA+Cp+DheeHSLEzEEc5D6pC6YPVxYDi1X0dX6eu1Y83y+ZONG3HlaZcZuSaXFNwi
         wcWw==
X-Forwarded-Encrypted: i=1; AKwUvBzMjxspJm8whE9U57fAYGLnqN+4uNm4Tk6uHlzquCoYJ2mtNAHRIfGptqeW7Db5vrJbcVjn+AthrGzhdA==@vger.kernel.org
X-Gm-Message-State: AFuF++lfWYhm/VIGlUDTMgMJ5Uit4Th08nsAzL+Hyh6M53394nGPynzk
	9ToiNOK7F9up5eYAZA1tb1ZgT9EYiwR4LMxB3US2VqaWX1q8BnsTOEIKzS/rxD1E6jpNwyHzOYM
	tujRy
X-Gm-Gg: AYBFou1Wn8q9tBJ/4kjcQeXRZoW9js6WtdCDUnuXLsGWYts+PnkNG1U5W4kFjoyAuD9
	1/FXryutQPMj5SCCuIuu29mAKtWfT/JMd0/1dOfFL5QH5j+mNsdVOtmuVY4mWwiDUl9t9SGGM6R
	OZccMUM0uQ2y3r6AYaOobRtTGjFnJZ4H2VTqTbHo1JpK/fbBo3ZkrfENy9jkRRg6zw73ef4QqSX
	g4dEj45pgFJvFreu0OHA749bo+aZU5EHRr8dmPrIXjuDFKp+WNEolgAlMGjioSNpFkqE5yB6KB7
	Jn6nhBEByVrcmGGaqC66TkI9PpxDMGifCCD99gFtSPMwLbF2QmLpc3psatz98/Y59hDTS31AGZE
	YCtOaDUE3fvse+EhNjvqtiaUEbrc1wE7WkGe2KCX0y06+Yh8io/krQ4qcer+u1amTA1V+5A3smN
	/Lb0dvqWxcZIUOIpwyeERzMPL50W9f66Vjvx6Kxww1/0Vl3E1kDZ2HwxCY74ikT/IJIsDKH1lJC
	5/NWfDhSvnkl2FU4ySzpf14OcgeNs59cnUR37gKuicYKqlep7mI
X-Received: by 2002:a17:906:9c95:b0:c29:3c97:c994 with SMTP id a640c23a62f3a-c2a158269a8mr262337166b.35.1789742412068;
        Fri, 18 Sep 2026 07:40:12 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1b7a369esm64244966b.9.2026.09.18.07.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:40:11 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Sep 2026 16:40:07 +0200
Subject: [PATCH v2 4/4] arm64: dts: qcom: milos-fairphone-fp6: Enable
 display
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-fp6-panel-v2-4-6695c4008920@fairphone.com>
References: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
In-Reply-To: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789742407; l=2284;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=rOIM11VEoZADWcbRxJB4CDrlUSZEECHpM7XwHlAs5pk=;
 b=5nrVe28d0+ILTAO21B6rnbOXqb369AcBA5MBYd6C1/4tJwe3W4233FgK8LXQ5jFlzlGaDbLNM
 +zuTWxGcU6aCgO5/FWz5kICtxX7zmlmf7rBCkpqypmiwXLGPoDKBW/M
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Configure the MDSS nodes for the phone and add the panel node.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 64 ++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 4e8777162b53..11015c3fa331 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -709,6 +709,49 @@ &ipa {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l4b>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "boe,bj631jhm-t71-d900";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+		vci-supply = <&vreg_l19b>;
+		vddio-supply = <&vreg_l9b>;
+		dvdd-supply = <&vreg_oled_dvdd_1p2>;
+
+		pinctrl-0 = <&disp_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default",
+				"sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l2b>;
+
+	status = "okay";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };
@@ -872,6 +915,20 @@ &tlmm {
 			       <13 1>, /* NC */
 			       <63 2>; /* WLAN UART */
 
+	disp_reset_n_active: disp-reset-n-active-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp_reset_n_suspend: disp-reset-n-suspend-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio65";
 		function = "gpio";
@@ -906,6 +963,13 @@ pm8008_int_default: pm8008-int-default-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio129";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &uart5 {

-- 
2.55.0

