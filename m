Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F014206B
	for <phone-devel@vger.kernel.org>; Fri, 29 Mar 2024 07:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711698363; cv=none; b=nBxMZmgHey3gxsPFUt/yphIR15T9Dghsi5rKrdGlaUr0yY4heHiz4TBc7gm24lhMokZOKao3q4nQH/Ez2Ej5TTQQWA26p0896XM9nG3VKaanoos+pzdADdqKLK0x70qyUNZx7tUoKKlhFNys7tyMhQw8l07VrqgNZGpUEBrJrPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711698363; c=relaxed/simple;
	bh=n21rq1fCcOmI3LogGCsxivAQaiA2nOT681cDr3he6c0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ploj1A+P2HT5dUoqoPig028gtAKeakpKx26QCgYOMFHUn6bNP6zZquF6LKAfFc0vCJ+fSKD1D5hcxy10kBEdSf/tfCtuNfntww9JX9IrevUuTKsAqpGsApT7ixTipFhbP752fDFkyQW7AT/hP5FeOGFJWm7IPWNiarxZVXfnr6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=I91P/lLq; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="I91P/lLq"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a466fc8fcccso223320066b.1
        for <phone-devel@vger.kernel.org>; Fri, 29 Mar 2024 00:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1711698359; x=1712303159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lcotkK4GO99SFGIIH8jXD+5kvmn1tNTmHBz7CWYrF30=;
        b=I91P/lLqOM6tmjHySPQ/xXKvsC/CtoEgiawiWFAqkVcGgKc1XShfsWkIfl4aM+ydiX
         Pzvpv40Wgzpaqg0KFE9kxutXawBhH6IDIpnJgCL+H2hQLnNJvhyQxcSj8ui46ami9sw8
         5DL4DBIWkZvyhVbAOm/n40ZR19BOLjkaoc316yQ+92mXYzNFHZAZCJzmXQm4tKNqpt5Q
         iwdxHI7wvbsrg6kcfRXgv4kZPT8+n9zsrVEVJrusSkA93/gTPxPV8zMir6cCh6zxrEyj
         9k6cWSHVoI1grlOjafzlVVtlfaX9G+lTgfWjK2NIFYRS2vgxUzQFZZUUThk8UTcazDLp
         EOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711698359; x=1712303159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcotkK4GO99SFGIIH8jXD+5kvmn1tNTmHBz7CWYrF30=;
        b=lPPBr6yc8BxVaTFiyhxdJWwhClsAoonatX5tCETia44MPwzgzzAuAOinMgFr/kTSEi
         CWpJUGJl8Ha6oEf8wAP1rgyMhwMgbLV8/N7M1/SI7r9y6uO/oP6m0k/umcU/aXzHq8aF
         Bb+hh+pLeSofaxT0HBeY9S25Ii6q9/+m/eAKogoMnyRILGs4lvvlXJm1qSezshMzFfoX
         W9BBsgph4V47CEVGTiDPyR2O2fM76jcZNqNaMFZIMUtBhOjWfpnQi41aS/zNYQmSQILL
         uXiS779s160j7yKQHeIalSCGZrA9lHq13p/TGSLDg1gAz4IAXOHE+l1koxWQXDmI4Ozz
         obOw==
X-Forwarded-Encrypted: i=1; AJvYcCX3dGYZZGIXr4sxaCWbMihKjI+ZczJ00R83uR4mlt+007jAQ+NDccyBfuN16kCzH46ToxT8jgvDucEp6G7tZj2KQ8lxYoD3EL+TU4Q=
X-Gm-Message-State: AOJu0YxphEXCjMv/zov3K5DekQJlBxNtua4ZVeroZuuDqbmXW7JuejEx
	nG5Dpg4Y3X+/vqEJVsc37xWtLT3rrytHJHRPJyx4aQ6pKwz+8Mf6j/qVqQBGZLwVmXK5/43amE1
	I
X-Google-Smtp-Source: AGHT+IE24627ppy3W0EYA3xkVYAvPY4pdoTFgJaCVO/S+vc52RfohmJ4tnXqThQoPHfY+9NaDMJ7Ng==
X-Received: by 2002:a17:906:a88a:b0:a47:5265:9aac with SMTP id ha10-20020a170906a88a00b00a4752659aacmr859536ejb.55.1711698359536;
        Fri, 29 Mar 2024 00:45:59 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709060cc900b00a4e24d259edsm1382737ejh.167.2024.03.29.00.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:45:58 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 29 Mar 2024 08:45:56 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm6350: Add DisplayPort
 controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-sm6350-dp-v2-3-e46dceb32ef5@fairphone.com>
References: <20240329-sm6350-dp-v2-0-e46dceb32ef5@fairphone.com>
In-Reply-To: <20240329-sm6350-dp-v2-0-e46dceb32ef5@fairphone.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

Add the node for the DisplayPort controller found on the SM6350 SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 88 ++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 24bcec3366ef..d7cf4b5ceea6 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2033,6 +2033,14 @@ dpu_intf1_out: endpoint {
 							remote-endpoint = <&mdss_dsi0_in>;
 						};
 					};
+
+					port@2 {
+						reg = <2>;
+
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp_in>;
+						};
+					};
 				};
 
 				mdp_opp_table: opp-table {
@@ -2070,6 +2078,86 @@ opp-560000000 {
 				};
 			};
 
+			mdss_dp: displayport-controller@ae90000 {
+				compatible = "qcom,sm6350-dp", "qcom,sm8350-dp";
+				reg = <0 0xae90000 0 0x200>,
+				      <0 0xae90200 0 0x200>,
+				      <0 0xae90400 0 0x600>,
+				      <0 0xae91000 0 0x400>,
+				      <0 0xae91400 0 0x400>;
+				interrupt-parent = <&mdss>;
+				interrupts = <12>;
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd SM6350_CX>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp_out: endpoint {
+						};
+					};
+				};
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-160000000 {
+						opp-hz = /bits/ 64 <160000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
 			mdss_dsi0: dsi@ae94000 {
 				compatible = "qcom,sm6350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;

-- 
2.44.0

