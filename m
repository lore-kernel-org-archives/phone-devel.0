Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485419;
	b=a6EZXVSgGuEZqR29zV2gqx9buhQR66PmVbOAsf9dOTjU7CCr2tubYaXi1qAOSOP3SY5k
	 ncYjM7tCbgK5riul+H2BqHJE1zUmWXXpyhzgAaQxEnXfdnCi3Iz6xbA3KS/80qXvlgLtp
	 LhV8Q0coveZuRUz5pP2amXTYhywXkkOAFtgWrFm1dEwpDeeciqkfvEI3Oz2SEdcu4sbVG
	 7+ypXFjyxJkamBfzGnvIa/A9uq+DhcCesQW7Qpbwn4FO6FLotW+RT5f2DQqhdSXx0SR53
	 D+TwhRWB+ObspxlXAtiAS/djn94R9YMWxPPjNxRWsbgCK40x73KSTDC9xZ/63LMcMUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ys7Nc7n51L/KeLLawMSwxhQi3I/mI/NHV1h3ZwDRG5A=;
	b=iMeKkUv/eCBfWnMOvytLaglgaIjJd+L7GJ6dIsm6o/6vZebJtkTyZP52L7hDYeIlZtY5
	 5OCKHZcfb+d1tl6EF0FYYDr63q3A+xM6vLjBx7Thao3teV/aOy+0TQU1nMK5IObayjfJa
	 nFa5e/RXI1em9BRgY8gU3G9AXVFMKc/pJy0B/CnEvXwvJIjrlN+gC4IutxWueWHuc/83O
	 YbkBTnI8eZUleL46P2N5KRvZgXJvjx8WO67FQEBGL7q6lwmW8YxyoIm3ZjiIiv5J3r39d
	 srzJ298gEPZv9Kc9XD7WL8O1q+3qQckVnz7UU8GgUOCxMKDtUW77IeWis6RsmQ4ENSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1m14udG;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B87606A326
	for <phone-devel@vger.kernel.org>; Tue, 24 Nov 2026 01:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B87606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1m14udG
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-92125687442so40167186d6.2
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 17:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795485418; x=1796090218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ys7Nc7n51L/KeLLawMSwxhQi3I/mI/NHV1h3ZwDRG5A=;
        b=N1m14udG0h8jba3K9ai5qMlm6qdGjG3bqClGk7/veFDHpq6CPyM49tjIn2rn8wTDTq
         BqffRqsGdLGdcgI8caRv3mW29ArdUKBFoz/nIJ/7tGkK75trdW6JgUc1/l2YlW4u3ZCN
         FZ7IX3CykWZHK5UVF3g+BjNiKwBHxUPQGRKXE7wGXe+B98lg/71Sa+vtmmWH8pMIiVoM
         KdRyAgPxzCm6s8CSiUjgLezFtfSpqcQrQfRf30AuF+7cYGfUxT19KzcWf9+vwlH+gH7D
         o2RbanUsOhjEl9HEY+PmSa94mU4VLDkv1HuwDoQwSuJHd3Cebng459miaQra0keaI+/v
         +tXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485418; x=1796090218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ys7Nc7n51L/KeLLawMSwxhQi3I/mI/NHV1h3ZwDRG5A=;
        b=GhUyz3O38r8jnsydTeIEtAHn+4ivPUHz+jReDpxLL1cE7AbnSmkDdF0BTWufj6asfe
         g0vvrQtaBgot19i095p9as/lTGbvY95ELasxtO/E545C3ASW+/PfaAUTwdJYJtDL8tAy
         HRRKWZv0d94oSRDjyTlPshJwX4GK/PCKM5zmNM2EzmUbboAyZSrMGciuXsKuJiLzJZf4
         CewOL4UjoxPtpz1+RtW2zp3WW3jQopE61q0l+WSbRdndatSCuYU2PP2DPxGTnEYEXHyg
         TB1nyUz5e0dG5P8Quiy2SoYVzIfLdGDnpax8DeirweTA4E/zkC9DGYtModZMh4smndfJ
         4ZIg==
X-Gm-Message-State: APuU4Z8gPysDDqu7XUNxgiagpK97dSa4oPswmEwZztE40LQAflvJUD7f
	v6/OBLe8931CBDA8t6/SmfmKAVWGSyRbfPI8SpgHmoKUgjocs8eqoPlf
X-Gm-Gg: AZFdTZc5Ube0d1VKaIJ0AorAJn6Oo973oHIOBjuCdpBJlwO80Bra2x8z6l4lQQm4c/r
	h1CXVUkrPOGhixYSXyOy+zbj0z0pRWDGQMEjeRRXo/9tVWBYi9AVC39a17wxLgRKVke6RSiSL44
	Q7iOSsFWjCt19pa31bfrdu8khJaiZOjoCHztJ+GZjJkHc3r6mP7+awh/7L6qDGSqeBGFY167ZoS
	HocCXMdPDDnHCnjX8qMKiTO7TDTYLDjaMTjMjohmWNyo6euLILz0XJdvlspE+tU7NVHq05AtAzf
	UEnDyeimbRjQKstjseT8SDi/WOizOHDLjzgReL722hlRpgln0uI9WdhnMDRRf/Hk+L2YOJTXQz7
	dHU3vUj85IUWbQVHwO/YCFJo4nCG5W1q5T/buZX2AQK6soX/Snm4LzmqWtiTiGpe2PQQG8DIy3i
	GrKfmay+VmSnGCOrkPpVo+4n9pQHTAMOkL7iANAclzKcR3btj9zkDXkyiK5SOKl0ESsX900SgyS
	Z4Zeowd4p9sEkWVrf/weIlpC/yCB+291GdAkffG6Z8rKRIdm6dM+TaQtK30NcTHM1mneI25Kr2E
	RT7gL0v1hltOEIG0jJHTucCk7nDy
X-Received: by 2002:a05:6214:27eb:b0:921:57fb:4bc1 with SMTP id 6a1803df08f44-92157fb4dfcmr85526476d6.29.1795485417823;
        Mon, 23 Nov 2026 17:56:57 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349eae11sm121629546d6.25.2026.11.23.17.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:56:57 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 3/5] arm64: dts: qcom: pm660l: add analog audio codec
Date: Mon, 23 Nov 2026 20:56:09 -0500
Message-ID: <20261124015611.187024-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124015611.187024-1-mailingradian@gmail.com>
References: <20261124015611.187024-1-mailingradian@gmail.com>
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

The PM660L analog audio codec (PMIC revision 4) controls the headphone
jack, and optionally the earpiece and speaker, at the vendor's decision.
Add the analog audio codec.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm660l.dtsi | 37 ++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
index 3f8b9eafe164..59afe3ba6fe6 100644
--- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
@@ -87,6 +87,43 @@ pm660l_wled: leds@d800 {
 			status = "disabled";
 		};
 
+		pm660l_codec: audio-codec@f000 {
+			compatible = "qcom,pm660l-wcd-analog-codec",
+				     "qcom,pm8953-wcd-analog-codec";
+			reg = <0xf000>;
+			interrupts = <0x3 0xf0 0x0 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x1 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x2 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x3 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x4 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x5 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x6 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x7 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x0 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x1 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x2 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x3 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x4 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x5 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "cdc_spk_cnp_int",
+					  "cdc_spk_clip_int",
+					  "cdc_spk_ocp_int",
+					  "mbhc_ins_rem_det1",
+					  "mbhc_but_rel_det",
+					  "mbhc_but_press_det",
+					  "mbhc_ins_rem_det",
+					  "mbhc_switch_int",
+					  "cdc_ear_ocp_int",
+					  "cdc_hphr_ocp_int",
+					  "cdc_hphl_ocp_det",
+					  "cdc_ear_cnp_int",
+					  "cdc_hphr_cnp_int",
+					  "cdc_hphl_cnp_int";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
 		pm660l_spmi_regulators: regulators {
 			compatible = "qcom,pm660l-regulators";
 		};
-- 
2.56.1

