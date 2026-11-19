Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107273;
	b=kI+MEiMC7/2G5VmHawp/G/Ikt+YwFvqokJ1fZmPPj6ONJPflYZ4TYJoB89bvBv1IH5j0
	 LjjPPQKEjmGMHl1TaGivu10aa1MftDoMyQbWpLyZZh44xPwuhqSdtcwi9iu4TVH+o+GZA
	 ocMZmDt+wxQtZj3QcCh2TkUMinDNtNgTRaLiUj8XU7RF3m8yNGTMwA7DoeoE+smmu0s7f
	 B2gVChj4IEMjv97xxKaR7g5Rgk1ForGX4acdyG/sPqbB2K/nyNivA2iZJyCX5slDUzEgi
	 9kYUMUJttuFFG1yUrya/sRq22J23Eydysrr2LhZCO988KqrKnliWY5Fb+QVDz5ZYSDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tqAZ8i8YHyd8H+59b7YVQzKbswaS0aGE8O0OFJI4g/c=;
	b=PHXrEPXVq7VkkeGJjjC3y0jExh6wbSEDvwxaMZQAIaYHzImWRkyVR1SzIbOfoItTCNsJ
	 GeTlDtnysiI8D+gLrqzBNjdr7XjmGnjkqp1b+vvER6nTXKA6UN9ouqQR1PNQSPYMfsg9b
	 DB8cxfhFBl6gTNrbkK7lDQDPbKVPGjrtV+G5olGWGVXQKoAo06tiltYueJ5Ylk3BfrTR4
	 wEBgmFVWGBq9QC+q0R84I5+Tb7YtU0OrJVLcbplW0/A0LqS8c5cYIo4VoBnyk6bGPaDsO
	 LwZZuWQsAvTljW/CsyyQPPYAITNc1L7TCfOIFc9GLMqkK8/dk431pRq/oI43SDGKJmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XjvZK7Pu;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670E060A5BCB
	for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 16:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 670E060A5BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XjvZK7Pu
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dee593f18so2512598f8f.3
        for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 08:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107271; x=1795712071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqAZ8i8YHyd8H+59b7YVQzKbswaS0aGE8O0OFJI4g/c=;
        b=XjvZK7PuZi8XTLMQa9L1sxjKmZ99wpMJwrPePbpWH07379UZUNok+6QSl9OC3Kggox
         FeCAOTpSGChqgFOVuCTcHjorrGpGYc5CohQoABPLaPZBcDDw17Q0VZW2GZshTqjA5iKQ
         Wi4a0lcEzN40ZbpCD02r7Q0jjIVCCJNzYofqFcHcPD/AaAYTQ5IHBDJPGOygekgGzhdN
         dIjMZvJgXgHZW/k+CljgLPFPTkvnB5OG5SMpeR+WlZVaF/cNyo0UeXmqPX8BP/GRobN8
         epQmPJeLpAp12sX9EPiUxmh3SrM2MY9gu8A5HVpKexGoiKKNmeGTZraqbvC4Qz+fjM9e
         7yzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107271; x=1795712071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tqAZ8i8YHyd8H+59b7YVQzKbswaS0aGE8O0OFJI4g/c=;
        b=SZ3E0B2OPt0vBCys5uWl5uu+yLtvmcn4aY4VAyfqAH+zkpDF/Y4mKY/evGtUNDExKK
         pCNmxerJG/P1526ulTcTXsnQG7TENOBqeOeK48y3DrV1pmjL2fOh4pcQR1e1DnjGcJka
         b/WIU6DF9ga5XNp85D8EzJwdhTNRcQy5Al1HwXzrHQocDnUgjnuuFVncmy4E0W1ODTgC
         keE/XEyAYIzNuIElwn3Qdou8R5aH5LkUk/a2l+0wMKQo3rXwxSzGaAB8ehaHz21r/AlW
         UBcJ5HgqtQsMvjAVX9gliNo6yl3jf/Bst2DkApdL0uA3Smu/MKqqOqDQm6D9i3uaFQHj
         FThQ==
X-Forwarded-Encrypted: i=1; AL+hErGOgpsBoVyfElbe057jCO+nT1ljADO4HvRRS2zsgbdcFM0StukLpH31EQHiYl/gqwjYTD/+gBE0lK3FfA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+kNV+Pjldp8wLIWLu1jOeGJvNRJtFoVJdMV7S2V0TFqpNIwABI
	4COuToQJ/xhliNFm40ASyyzE+BGJPZdbPxql8mqcj4Vb/DmW6hZHsfm6
X-Gm-Gg: AYBFou0mCnoO1i7P0zXIteDOt4OC9b6oR+BMpP9J9Rzk4auoRnV95Zmq4P5rrLRJBU/
	91zJ58SAPCkmzBIq6iwbSXh38OH5dkD+KE3YK13lcNkyiAdi7SYzMpnU8DEEpXb/Qq/fMFRrJWj
	1q8zXB8SBP49DaoBMvJQBq7Q/q+A9kUtarUY3leEXPXa9fjBN68UoNNQewXDcf8xEdR6vEQCalm
	S2lbduwrZ8zjUkcP7BwUyXZoM+Au68jM8Hs90LCMZJQu51474L6XIttt2goKv0uc7k4DIdVSBnj
	DoosWIWdoSVY1zlmUSXkLUePRqxvSHFVugcKBvli4Y+P2QQgDwmMEMdMZafLYy9JLd1TpAonzD4
	x/lkcn4X7q3l1uMZJUsz0ob+2lHhiXveyNj9urNXHQAiYxa2Ltu8ZeYDgzFd3x78rywSaPIyLLL
	H1wejaCFg7OHC2Ame1sC4EuqAvfK3P4PY0lRTM9DcuzSvAj0JJ8bYv8tXhz/sX5IjwL+Fvw3QOE
	Id/kaWiXA1G51KmISRYHYTPKpB0xqGH1SavIjgPxdOfNQ/TWrijqLOrs88vFgXqc1/gmdBz0nYa
	hH+GuUb1pv/lg/tTqNsoWEhafIxdDXfUvfZEpw7eKWQXsKvoNVlmOrgz/cC7McoD2S8XialhwqI
	=
X-Received: by 2002:a05:600c:8184:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4bb8881e969mr1657545e9.28.1795107270775;
        Thu, 19 Nov 2026 08:54:30 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:30 -0800 (PST)
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
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v3 07/10] arm64: dts: qcom: sm8250-lg-timelm: enable SW43103 panel
Date: Thu, 19 Nov 2026 17:54:17 +0100
Message-Id: <20261119165420.24466-8-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
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
index 00e3fa560e95e..59d6c1518a469 100644
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
 	google_assist_state: google-assist-state {
 		pins = "gpio1";
-- 
2.39.5

