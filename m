Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D5731E0FB
	for <phone-devel@vger.kernel.org>; Fri, 20 Feb 2026 09:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771579159; cv=none; b=NXRrH2lKHTH+1HdjbDUV8oo3Edg5vrM8fSZydVVJcGlS7Ys57dNp1JNoLT73U9GI0q6XgkkkWJF+yub0HkXdKomjFpUCozPEdLh0fOH4RqMrQ4zhwXoXtP429aNsg2H4RD5MkjbG9e9ip34jGc3kccccihaSKxy/2RSpULNzEZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771579159; c=relaxed/simple;
	bh=C+wsarVI55ZZRQ3B5XA+RMI2p40E5xuzn687URb4gIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LH5t7i94Jpc3Pn9d/HTHx6YzadxVeoJQGYge8nEwVZQNcKE9+dPijXCCP8f4ioPbHleVvhsxJD70+d/HCyiFPCoVe7qmtUXO0A+78jzSN8daGX6vmd8fw8WBXl2iJWadnuJIGWXNf6rINC/VnAYG2Vy33W6gR6c0NAJbXGvfTkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=iaAcC00L; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="iaAcC00L"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8850aa5b56so342210366b.2
        for <phone-devel@vger.kernel.org>; Fri, 20 Feb 2026 01:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1771579155; x=1772183955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6F37dsCD+l3Kjiw05UW38NxOXviWKT0380mYL15ak4=;
        b=iaAcC00LodtDz/r4vB+VTwoeWfpGCyQrFsYFj91kPksn2uYUwl0oLdm1Y3bJuQcmyh
         /t7R96eK34WUvAtIxI42JeW0vhs8RpFvOqN5alRsbzuSTda5dlC28zuuER/aQ8MzpaEI
         ULeGO9eD1iTZQOYoFo5XhemBGdl28Q9jRUZeTJqrfBMzwWFZYoa26eYhF9u8+KHEXHyl
         E0BTC6WpeiCX/f3EE6GgSRB1B8dSROAoyr4rd3gy1DxGXCCcup2LKE0xUFq14OpVsS56
         5NyHf26vXjju4yn0eLFUj4F6uEuCl2jFgi8nBGkVrW/w2c8iw1B8GRPRvNI4Y/fzC3KM
         uKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771579155; x=1772183955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u6F37dsCD+l3Kjiw05UW38NxOXviWKT0380mYL15ak4=;
        b=CggSI9E8u4SKr2cWpr3d59+XQmpjL2JtD3BkR1GE3MkHB3FsaVbmH96om6xhraH8YB
         xjjFBsKYD6ELfDCDyg7McqH19Gm5OmlvDkm3JvHqIE2bGquVd8IBEqFjuAw5bWhfherQ
         EH+/lf6cKaOtips7m/P8oIcyXN8ZJcEG9KtWejrAN3OpnBDxMBjnpAgSXN0egtxaBe80
         w/FN/FCiaxxDHzXq4FcovH4BlveSLUB7OJE26OF2vMgSBP71wM3+2g9s6BjYoqJxX2W8
         0mqqQH2c+hX542oMP7h3svS1zEz7CkAcoFF5XYaAuRuHcjSi6Z1uckwzGTFISC3Yxg1x
         JhmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1ANuaXGvSFF1prvXMRWbW6a581SNvSQ735xgm3KDx5PfVK3PAkSEa2YpQ1TrKDv/Q5HB4sOZ3CqIoyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YytZWTopWqv8I15xoUwbvZ+RtiMYbKZCdCv449VXRzBkWSuihyJ
	Y9y5vGKeOFnXaBneG8PrFSQDelewGWRMOwK/9qS5K0xF9VXZzyfgyXkjn9WIASoMVrA=
X-Gm-Gg: AZuq6aJODFztPgJOgVaTEIaQQfIf3dAEJRRYLDVxEWALaeoYhiRYFtHORDVatYDapbP
	w4LvEegCwLrkgNe1yYAkSVtr+3tfn9vfAJH6Gu/WAd81iq4N2AN4nE6EvW7nGHMUcE2vK+Y2eH0
	SMZ+UE9xoPbuKzcM7oVGs0oS9TofBrnpoHIvXbM1irwgNTIJQEts9VYv2H2jIBD+RF8GBP4UnjU
	DNHf+xnzJ6zluzVnvmsGByFBq9m9WQKrlF1De0iA50wNHPS+0Zti/MVqVaj9tZND7JyTH/yjHsO
	DoSFoaDMFl0nKY9ZGKkpTH60L4loUaT54/E5IfZNO/uG7aEwfVFLsc1w6w8MzamHgon41uqERs7
	SLKG4UQBK6ABkDuVWX9qPPT3iTAn6YVauznKgkOTqDgzXnEZau9BESlgxXgXDs8DaQThbnbPk/p
	s4BWPUMRicbmh7FAaVmvT362FHS2KWa13/UjXDyeRu6dE5uxjTNlAHHWwQBQy8QuEU3shC59e2X
	XohYg==
X-Received: by 2002:a17:907:86ac:b0:b87:3c4a:e68a with SMTP id a640c23a62f3a-b9072e7a717mr62188166b.9.1771579154631;
        Fri, 20 Feb 2026 01:19:14 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc769111fsm667098666b.57.2026.02.20.01.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 01:19:14 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Feb 2026 10:19:08 +0100
Subject: [PATCH v2 4/5] arm64: dts: qcom: pm7250b: Define battery
 temperature ADC channels
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-bat-temp-adc-v2-4-fe34ed4ea851@fairphone.com>
References: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
In-Reply-To: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771579150; l=1351;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=C+wsarVI55ZZRQ3B5XA+RMI2p40E5xuzn687URb4gIE=;
 b=T4QbfcfFNBuzPHyJEr/F2U8LVosN8lPbSUjMYubLbaa2KgB748SbdekHcjXI0agmKW1SoNgGy
 vLJ7EthvVKhBSFCWTH42xcBLl0ss7sWNlc20UjjFtalqtW2vF3aSf04
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the definition for these ADC channels to the PM7250B definition.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 0761e6b5fd8d..c96089520548 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -156,6 +156,22 @@ channel@1e {
 				label = "chg_mid";
 			};
 
+			channel@2a {
+				reg = <ADC5_BAT_THERM_30K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_30k";
+			};
+
+			channel@4a {
+				reg = <ADC5_BAT_THERM_100K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_100k";
+			};
+
 			channel@4b {
 				reg = <ADC5_BAT_ID_100K_PU>;
 				qcom,hw-settle-time = <200>;
@@ -164,6 +180,14 @@ channel@4b {
 				label = "bat_id";
 			};
 
+			channel@6a {
+				reg = <ADC5_BAT_THERM_400K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_400k";
+			};
+
 			channel@83 {
 				reg = <ADC5_VPH_PWR>;
 				qcom,pre-scaling = <1 3>;

-- 
2.53.0

