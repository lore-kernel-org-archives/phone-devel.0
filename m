Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160050;
	b=UI1p5Ti7JoFCKdvt//waXxPHCxJRQ43h05HmBOZJu/pG3Hcz/s6S/QzNDIpyuHVo6GWk
	 0kKsIUYVNTRxU3khaJiRriPaRIfkDvoSJ4Nttr1DqXYk1UmRSgG/xK2sz9PplKsUdTm2O
	 b4OQYU1I/2TZ1lCoOurgAzcP1mp2HxG6Tfppy2LAi4u0FHVZaGhFlHUI3YcPknuRfWPRK
	 5doOsyReDQxj6iZWnci8BSnI0FJ0tQuk8NPX20LRjuCgPiscg8BhsAyZsGSKW7KUo7p5M
	 XjX2S4b8GhyaoEXVVF+k7nC3aIj+hP1bX9VpNx5a/u1oHeDoVUWcE/tzYuVvMcHbNaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
	b=UkPkXTqgyWhlQnYaeQJ9j4oJ4u6c86XNVVEVDa4yn9w/eybnwkSMt3ebe7d9DjnsMbT+
	 7FaTfUHRhmhjpbwTs1O9M/aWw7nxzvPdoC5qlZzzQ7ZI5VcTm/Vv1KSLR/PHO8ijLMGr4
	 bD9GreoQP01wNvVgI0HunpDGqlOGRxXtS8r1viYIxBz43Z++dD9n+LhSiKtKyDnp1BMTM
	 ZJeBXB+hRBm3pYOiVWQrrjBiWEII8enMRGh0orMI3zuBQ+cKUT1LiKTwur+7HgJqYTlpr
	 ctaCmq43VQ0+flKA+znHQ/K9evSJMEkaqFu3/nx3IEdd96f7wWawO70D43RIAra6Qfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sk3PdhS6;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C3C60A2607
	for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 07:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7C3C60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sk3PdhS6
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso5692735e9.3
        for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 23:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160048; x=1795764848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
        b=Sk3PdhS6u6GXkbXWDqXN4JbGbmCkBpKSZInRKLGFgBkhxX9mXxArpFf+rNaPZCwxU3
         3CGUvU9V68SAPRRct0FFpaEiOvp0VW5tPkqFGZ43AG+z/prjGacZajMS1sC4yXfIceeE
         hrWO2FrbS/V76SVw4FPSbKRpvuim+GphReaxGH/r8zDBT5Oonid7RGlEX4MWZ5+t0ZgK
         oZ5bq4BfqdAMXHwVrJfBOEzKNDUUUHf3rvuyMejdrknr1/79kCKrIWrW/GqOwQ2ZMz0W
         eSlgH3ZQGqwuba/uOXHZZemAE2ZhC/awGcVUrPBI7kiXZtNMa328GJ7IYVu8rq1KSraM
         loJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160048; x=1795764848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
        b=SuXgKL/SZJL2PEPHqOrMPQN5vvcjJFGastg0tuSecNgsQ3JzRl069nl5NT7g/RYiCI
         nTFcmV33pN+kU4paFUi3GURMDdCUoA10p0WLUIxKJ8ga04tuK+H04yy5vTWO3RDhdWpK
         J8khRuBf3sy5PF5CSyF18weabdz7CXXxwGrxrWrpzBCdiQJw+jTJ5L8dPYQ9tj8205bT
         Ktjb0hIi/hqC71fz26MYlTNjB0tQLglYbiW+GFTA6hHwKGaROrQSafBQsnp7GWvw/v2o
         sL5vFz9B2c83C45tr0I+4tyD3ol5N0SjckICG1HkphB8/70tXeQP90F/IiIe6yNBTfMH
         TDuA==
X-Forwarded-Encrypted: i=1; AL+hErE+igu/0mAtKz5cbimT5Aj6gsyyxfjsdajhXzHjfRE1eneAWgIyzS0puqOVeFA/6D6jRnKq8OM/gDYQFQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/DaL3lEO6jAjaeRpOyHhodZhl8EzgdbexuBPRTtzbJ4YMrtprB
	SQDDiXZOUr5aBziOKy/A4/euV00FHETQ4RxbWxs/l+S0X+oiTPgHdI+D
X-Gm-Gg: AYBFou2MQJCQnPSPB66Cw+Zp88vIayGMzt13zexXmNK81ureyeQ9S+KPsrqXg1MgBFl
	lyDn4DSp8UWBGTHOlVIglmtjpH/Dv1oV21Jp61ojOsz1uTa0tpt0NBgS6jemP3W3z9h98qT9gJ0
	8kIirkNxrpOyXbuRhBsqzwAMSsPxRk4bPRuX8Kr/I/3woPZGHnunx9vuf1wfnBbOwul8Mv9wnHJ
	/Vp3+I3tjqEkAKuyppkj3P1ojyKEfwiHbAhydB81kkMs/XYWLYQqvHXgnpsBf9rfb27yWd+ciHo
	JODg2yL0c0V8QV6EagIPp17YGNQC9AOSoeeX8HLYn77OO5gbgWB+U1DWV8bkiT/arIibLbgYh7d
	Ote5/PcRXu3JWsD1MtXPysImiWzptOZgLfnre7rDg0/JkXBIorSYD+ju36qpyrgBs5GiNk/xWai
	o08lq7U5do06sMqcFY2+Wk2rKt+dO7mtpSeLlYJWo4l0I4f2PCU2kDSRKuu4tBT80AhoQ2krkaZ
	355Hrl0bpIgurhJ9UVYrb168fE69YugrQoUxdss179kmXdFBVj48bGLKrGvDQZkoHo0ztz6NzKK
	mm5LMAy1fGrLnnPgep30C+tZvF/qRI8liy5eVIN1CYlzhIaKJPLqqHn/3GH/w8EQWkwyoAYjcKg
	=
X-Received: by 2002:a05:600c:3b99:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4bb8880b984mr52971675e9.14.1795160048060;
        Thu, 19 Nov 2026 23:34:08 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:07 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v4 07/10] arm64: dts: qcom: sm8250-lg-timelm: enable SW43103 panel
Date: Fri, 20 Nov 2026 08:33:55 +0100
Message-Id: <20261120073358.10267-8-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable MDSS, DSI0, and its PHY. Attach the SW43103 panel with its power
rails, enable and reset GPIOs, and four-lane DSI link.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 20aaf70355158..709cf9674e2d4 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -461,6 +461,42 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sm8250/LG/timelm/a650_zap.mbn";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l9a_1p2>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "lg,sw43103";
+		reg = <0>;
+
+		vddi-supply = <&vreg_l14a_1p8>;
+		vpnl-supply = <&vreg_l11c_3p0>;
+
+		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&pm8150l_gpios 4 GPIO_ACTIVE_HIGH>;
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
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5a_0p88>;
+	status = "okay";
+};
+
 &pm8150_gpios {
 	assist_state: assist-state {
 		pins = "gpio1";
-- 
2.39.5

