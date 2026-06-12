Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB23C2874E3
	for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 12:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781269186; cv=none; b=e/DI0JQL+eju0deoKcbp3WBu9iST1xPf6OTgLPu3kGkDNGzct4fXkprlFRQOCkiCDTB7sQk+BnPEE1BTESK1YwmOLZCUt1GwixXjyuIbJZdmBPLtCS2ShPxyelZMgpyI0b06uIPtcY2OZatOOQ90vgohueUp7ks0HbsHQYRXCyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781269186; c=relaxed/simple;
	bh=l7PKQn4G4jZ1CWm4xvKnuPcKlal1kaFGJZ8fJgoL5WA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=r4rmZ2bjyEWx8N7tlW0IA/9+zo4/7UTGIU5zpLfVkkgZSsa/Y9eP6OPN7y6ZxobmSOcUGAkh7Y23nWfN1k2SK30mLEaM8Kw3k0CEVxoV6WUzx+s8XYJycf8nXd3DaoRN9+O1JN5EZhzp4wFVVwjdsjE4MpAHW8VBIU/p09jyR1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v36kY9Q/; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v36kY9Q/"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa5a77c07aso143154e87.2
        for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 05:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781269181; x=1781873981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvrBNPuQQgjSQ8oBr8I/pNkbn3Z013FOtecv+Tv5e40=;
        b=v36kY9Q/xhzScAppugoPV+rEdDCzDj3ztVweiFb3PFaoSiO3QdqsYH/u9dV+TVHvm8
         94YZvxY9Zyi8FCoDhinIsdfCjKu9ENoTpEhxNg5CwTHR3iEWa9jN62KXM9wsgLiyn/DE
         74NO+bylhVoiifLtKcve7aOAvK42/XW9+ba6ljquLyznIxle2EbcjO4rBIlMj91c6LQQ
         0HgQEvqoLXDOTIFmASRSP3cOksqi69fCDgVI89w/Dnx8RFajbTRb4DDN4BesNiIlasle
         K7JLz3Y6zg2pKuj9C9GXSuqlkivPtnaJ55Dy0hmCf9hilP1OKw8nwcEDdvuM+vnBBHJ1
         OrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781269181; x=1781873981;
        h=content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HvrBNPuQQgjSQ8oBr8I/pNkbn3Z013FOtecv+Tv5e40=;
        b=hv6EtSaiJGNKpVDvStx7ku0gsUcLqIwejia8yKLL6nnrtb8tzXECnN8jABCDa3n2hW
         nyex8waY6NY7KqyVJa8YQIVrNoXTthJafhFpGG0/FM6ZymH2IyELAulst6/gezbPWHpk
         FBFQHBFi16TOSloBsyHfYtULRTkwFZC4BY5d4dyPopk3ehESdDU/sLbjzNb54rq1SpPP
         8e+nBIPqJFtFmy1KDuV0Dn/uP8w7PdHy6+zuRprmsFCTgJ63tqVigz2tXIqaryxr0uhU
         dS2GZhzfw63dYjtzIxKM07zO5ik+JUSDiPxEFE4FZ67uRnBQ41KRqUtkL/oLdx3NQx1+
         2SHA==
X-Forwarded-Encrypted: i=1; AFNElJ8ngwI+CaRzJ7QrXmEVUh489nYmZDXRU3a17itCml74kfPd1e9p+iXUZlGHds4lA8dmsytor4I+5vXqSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRqiNTPLScEgPPrIeAOcWUiZp3WRHQiOfsh+jRoHIyYSb8ume7
	cB+TRzbBxXxV9TWGG4ld2eDr+41LlWD8OMEdP5vgzovdDDPQijIl+L+qVF57rWuK+fs=
X-Gm-Gg: Acq92OEGt0MLkyNlRBnLhGmMj0eHEG3D42e14yUT/Om81Wau4vpNriCDjc+SFboyFEY
	nqMuB/3JVIS9y1jZ/baK/TjbYEbKOWAFuzIJSyaTS3wKEf9NHB4dbpNQde9bL+CzWDu299FC3LW
	e9ucgWWh0gbtaflOLSb9rdqo6rDrZPuSdPtmrzMKV+R83fFWvoaYsnaQMfbX4crre1YUKvpZh+N
	s2tYn/j6X3H5pthMrPRUhEhoIdJo89BAhu+Ok39ewmb/JRPDAf0KqqtAmWWfYUqMD1yBQfoe5v4
	5t9pTi7WGcQUIY/IZmGUemM0sC4da/N+XsCRTRzLoTc8N7NVfIQ9x/2GCvGP/ap5zu07WWb0fh8
	zmzbsOTqEXiXrPu0fdkTpCANEnVHwkYwk2shn6psx67CvMKUXNv5kU2tGEwMBG9G0/eRTehruK1
	xH0Mlh25yE9EirMg+Ck+tOHcZLZkwUZ7g7z/5PeuVzT8x3R4ehq+YDxLI2NaUqg9YjASVJy6ATq
	iub7w==
X-Received: by 2002:a05:6512:3b0a:b0:5aa:67a9:e9da with SMTP id 2adb3069b0e04-5ad2dac06afmr398860e87.0.1781269180995;
        Fri, 12 Jun 2026 05:59:40 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b08d4sm517795e87.66.2026.06.12.05.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 05:59:40 -0700 (PDT)
Message-ID: <f05ad4ae-140a-40a7-a6ef-9ac2ddb0a939@linaro.org>
Date: Fri, 12 Jun 2026 15:59:39 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [PATCH 1/2] arm64: dts: qcom: kodiak: Sort pinctrl subnodes by pins
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
In-Reply-To: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

As documented in the "Devicetree Sources (DTS) Coding Style" document,
pinctrl subnodes should be sorted by the pins property. Do this once for
kodiak.dtsi so that future additions can be added at the right places.

No functional change intended, verified with dtx_diff.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
  arch/arm64/boot/dts/qcom/kodiak.dtsi | 1382 +++++++++++++++++-----------------
  1 file changed, 691 insertions(+), 691 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index fa540d8c2615..62daef726d32 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5835,6 +5835,676 @@ tlmm: pinctrl@f100000 {
  			gpio-ranges = <&tlmm 0 0 175>;
  			wakeup-parent = <&pdc>;
  
+			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
+				pins = "gpio0", "gpio1";
+				function = "qup00";
+			};
+
+			qup_spi0_data_clk: qup-spi0-data-clk-state {
+				pins = "gpio0", "gpio1", "gpio2";
+				function = "qup00";
+			};
+
+			qup_uart0_cts: qup-uart0-cts-state {
+				pins = "gpio0";
+				function = "qup00";
+			};
+
+			qup_uart0_rts: qup-uart0-rts-state {
+				pins = "gpio1";
+				function = "qup00";
+			};
+
+			qup_uart0_tx: qup-uart0-tx-state {
+				pins = "gpio2";
+				function = "qup00";
+			};
+
+			qup_spi0_cs: qup-spi0-cs-state {
+				pins = "gpio3";
+				function = "qup00";
+			};
+
+			qup_spi0_cs_gpio: qup-spi0-cs-gpio-state {
+				pins = "gpio3";
+				function = "gpio";
+			};
+
+			qup_uart0_rx: qup-uart0-rx-state {
+				pins = "gpio3";
+				function = "qup00";
+			};
+
+			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
+				pins = "gpio4", "gpio5";
+				function = "qup01";
+			};
+
+			qup_spi1_data_clk: qup-spi1-data-clk-state {
+				pins = "gpio4", "gpio5", "gpio6";
+				function = "qup01";
+			};
+
+			qup_uart1_cts: qup-uart1-cts-state {
+				pins = "gpio4";
+				function = "qup01";
+			};
+
+			qup_uart1_rts: qup-uart1-rts-state {
+				pins = "gpio5";
+				function = "qup01";
+			};
+
+			qup_uart1_tx: qup-uart1-tx-state {
+				pins = "gpio6";
+				function = "qup01";
+			};
+
+			qup_spi1_cs: qup-spi1-cs-state {
+				pins = "gpio7";
+				function = "qup01";
+			};
+
+			qup_spi1_cs_gpio: qup-spi1-cs-gpio-state {
+				pins = "gpio7";
+				function = "gpio";
+			};
+
+			qup_uart1_rx: qup-uart1-rx-state {
+				pins = "gpio7";
+				function = "qup01";
+			};
+
+			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
+				pins = "gpio8", "gpio9";
+				function = "qup02";
+			};
+
+			qup_spi2_data_clk: qup-spi2-data-clk-state {
+				pins = "gpio8", "gpio9", "gpio10";
+				function = "qup02";
+			};
+
+			qup_uart2_cts: qup-uart2-cts-state {
+				pins = "gpio8";
+				function = "qup02";
+			};
+
+			qup_uart2_rts: qup-uart2-rts-state {
+				pins = "gpio9";
+				function = "qup02";
+			};
+
+			qup_uart2_tx: qup-uart2-tx-state {
+				pins = "gpio10";
+				function = "qup02";
+			};
+
+			qup_spi2_cs: qup-spi2-cs-state {
+				pins = "gpio11";
+				function = "qup02";
+			};
+
+			qup_spi2_cs_gpio: qup-spi2-cs-gpio-state {
+				pins = "gpio11";
+				function = "gpio";
+			};
+
+			qup_uart2_rx: qup-uart2-rx-state {
+				pins = "gpio11";
+				function = "qup02";
+			};
+
+			qspi_data0: qspi-data0-state {
+				pins = "gpio12";
+				function = "qspi_data";
+			};
+
+			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
+				pins = "gpio12", "gpio13";
+				function = "qup03";
+			};
+
+			qup_spi3_data_clk: qup-spi3-data-clk-state {
+				pins = "gpio12", "gpio13", "gpio14";
+				function = "qup03";
+			};
+
+			qup_uart3_cts: qup-uart3-cts-state {
+				pins = "gpio12";
+				function = "qup03";
+			};
+
+			qspi_data1: qspi-data1-state {
+				pins = "gpio13";
+				function = "qspi_data";
+			};
+
+			qup_uart3_rts: qup-uart3-rts-state {
+				pins = "gpio13";
+				function = "qup03";
+			};
+
+			qspi_clk: qspi-clk-state {
+				pins = "gpio14";
+				function = "qspi_clk";
+			};
+
+			qup_uart3_tx: qup-uart3-tx-state {
+				pins = "gpio14";
+				function = "qup03";
+			};
+
+			qspi_cs0: qspi-cs0-state {
+				pins = "gpio15";
+				function = "qspi_cs";
+			};
+
+			qup_spi3_cs: qup-spi3-cs-state {
+				pins = "gpio15";
+				function = "qup03";
+			};
+
+			qup_spi3_cs_gpio: qup-spi3-cs-gpio-state {
+				pins = "gpio15";
+				function = "gpio";
+			};
+
+			qup_uart3_rx: qup-uart3-rx-state {
+				pins = "gpio15";
+				function = "qup03";
+			};
+
+			qspi_data23: qspi-data23-state {
+				pins = "gpio16", "gpio17";
+				function = "qspi_data";
+			};
+
+			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
+				pins = "gpio16", "gpio17";
+				function = "qup04";
+			};
+
+			qup_spi4_data_clk: qup-spi4-data-clk-state {
+				pins = "gpio16", "gpio17", "gpio18";
+				function = "qup04";
+			};
+
+			qup_uart4_cts: qup-uart4-cts-state {
+				pins = "gpio16";
+				function = "qup04";
+			};
+
+			qup_uart4_rts: qup-uart4-rts-state {
+				pins = "gpio17";
+				function = "qup04";
+			};
+
+			qup_uart4_tx: qup-uart4-tx-state {
+				pins = "gpio18";
+				function = "qup04";
+			};
+
+			qspi_cs1: qspi-cs1-state {
+				pins = "gpio19";
+				function = "qspi_cs";
+			};
+
+			qup_spi4_cs: qup-spi4-cs-state {
+				pins = "gpio19";
+				function = "qup04";
+			};
+
+			qup_spi4_cs_gpio: qup-spi4-cs-gpio-state {
+				pins = "gpio19";
+				function = "gpio";
+			};
+
+			qup_uart4_rx: qup-uart4-rx-state {
+				pins = "gpio19";
+				function = "qup04";
+			};
+
+			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
+				pins = "gpio20", "gpio21";
+				function = "qup05";
+			};
+
+			qup_spi5_data_clk: qup-spi5-data-clk-state {
+				pins = "gpio20", "gpio21", "gpio22";
+				function = "qup05";
+			};
+
+			qup_uart5_tx: qup-uart5-tx-state {
+				pins = "gpio22";
+				function = "qup05";
+			};
+
+			qup_spi5_cs: qup-spi5-cs-state {
+				pins = "gpio23";
+				function = "qup05";
+			};
+
+			qup_spi5_cs_gpio: qup-spi5-cs-gpio-state {
+				pins = "gpio23";
+				function = "gpio";
+			};
+
+			qup_uart5_rx: qup-uart5-rx-state {
+				pins = "gpio23";
+				function = "qup05";
+			};
+
+			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
+				pins = "gpio24", "gpio25";
+				function = "qup06";
+			};
+
+			qup_spi6_data_clk: qup-spi6-data-clk-state {
+				pins = "gpio24", "gpio25", "gpio26";
+				function = "qup06";
+			};
+
+			qup_uart6_cts: qup-uart6-cts-state {
+				pins = "gpio24";
+				function = "qup06";
+			};
+
+			qup_uart6_rts: qup-uart6-rts-state {
+				pins = "gpio25";
+				function = "qup06";
+			};
+
+			qup_uart6_tx: qup-uart6-tx-state {
+				pins = "gpio26";
+				function = "qup06";
+			};
+
+			qup_spi6_cs: qup-spi6-cs-state {
+				pins = "gpio27";
+				function = "qup06";
+			};
+
+			qup_spi6_cs_gpio: qup-spi6-cs-gpio-state {
+				pins = "gpio27";
+				function = "gpio";
+			};
+
+			qup_uart6_rx: qup-uart6-rx-state {
+				pins = "gpio27";
+				function = "qup06";
+			};
+
+			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
+				pins = "gpio28", "gpio29";
+				function = "qup07";
+			};
+
+			qup_spi7_data_clk: qup-spi7-data-clk-state {
+				pins = "gpio28", "gpio29", "gpio30";
+				function = "qup07";
+			};
+
+			qup_uart7_cts: qup-uart7-cts-state {
+				pins = "gpio28";
+				function = "qup07";
+			};
+
+			qup_uart7_rts: qup-uart7-rts-state {
+				pins = "gpio29";
+				function = "qup07";
+			};
+
+			qup_uart7_tx: qup-uart7-tx-state {
+				pins = "gpio30";
+				function = "qup07";
+			};
+
+			qup_spi7_cs: qup-spi7-cs-state {
+				pins = "gpio31";
+				function = "qup07";
+			};
+
+			qup_spi7_cs_gpio: qup-spi7-cs-gpio-state {
+				pins = "gpio31";
+				function = "gpio";
+			};
+
+			qup_uart7_rx: qup-uart7-rx-state {
+				pins = "gpio31";
+				function = "qup07";
+			};
+
+			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
+				pins = "gpio32", "gpio33";
+				function = "qup10";
+			};
+
+			qup_spi8_data_clk: qup-spi8-data-clk-state {
+				pins = "gpio32", "gpio33", "gpio34";
+				function = "qup10";
+			};
+
+			qup_uart8_cts: qup-uart8-cts-state {
+				pins = "gpio32";
+				function = "qup10";
+			};
+
+			qup_uart8_rts: qup-uart8-rts-state {
+				pins = "gpio33";
+				function = "qup10";
+			};
+
+			qup_uart8_tx: qup-uart8-tx-state {
+				pins = "gpio34";
+				function = "qup10";
+			};
+
+			qup_spi8_cs: qup-spi8-cs-state {
+				pins = "gpio35";
+				function = "qup10";
+			};
+
+			qup_spi8_cs_gpio: qup-spi8-cs-gpio-state {
+				pins = "gpio35";
+				function = "gpio";
+			};
+
+			qup_uart8_rx: qup-uart8-rx-state {
+				pins = "gpio35";
+				function = "qup10";
+			};
+
+			qup_i2c9_data_clk: qup-i2c9-data-clk-state {
+				pins = "gpio36", "gpio37";
+				function = "qup11";
+			};
+
+			qup_spi9_data_clk: qup-spi9-data-clk-state {
+				pins = "gpio36", "gpio37", "gpio38";
+				function = "qup11";
+			};
+
+			qup_uart9_cts: qup-uart9-cts-state {
+				pins = "gpio36";
+				function = "qup11";
+			};
+
+			qup_uart9_rts: qup-uart9-rts-state {
+				pins = "gpio37";
+				function = "qup11";
+			};
+
+			qup_uart9_tx: qup-uart9-tx-state {
+				pins = "gpio38";
+				function = "qup11";
+			};
+
+			qup_spi9_cs: qup-spi9-cs-state {
+				pins = "gpio39";
+				function = "qup11";
+			};
+
+			qup_spi9_cs_gpio: qup-spi9-cs-gpio-state {
+				pins = "gpio39";
+				function = "gpio";
+			};
+
+			qup_uart9_rx: qup-uart9-rx-state {
+				pins = "gpio39";
+				function = "qup11";
+			};
+
+			qup_i2c10_data_clk: qup-i2c10-data-clk-state {
+				pins = "gpio40", "gpio41";
+				function = "qup12";
+			};
+
+			qup_spi10_data_clk: qup-spi10-data-clk-state {
+				pins = "gpio40", "gpio41", "gpio42";
+				function = "qup12";
+			};
+
+			qup_uart10_cts: qup-uart10-cts-state {
+				pins = "gpio40";
+				function = "qup12";
+			};
+
+			qup_uart10_rts: qup-uart10-rts-state {
+				pins = "gpio41";
+				function = "qup12";
+			};
+
+			qup_uart10_tx: qup-uart10-tx-state {
+				pins = "gpio42";
+				function = "qup12";
+			};
+
+			qup_spi10_cs: qup-spi10-cs-state {
+				pins = "gpio43";
+				function = "qup12";
+			};
+
+			qup_spi10_cs_gpio: qup-spi10-cs-gpio-state {
+				pins = "gpio43";
+				function = "gpio";
+			};
+
+			qup_uart10_rx: qup-uart10-rx-state {
+				pins = "gpio43";
+				function = "qup12";
+			};
+
+			qup_i2c11_data_clk: qup-i2c11-data-clk-state {
+				pins = "gpio44", "gpio45";
+				function = "qup13";
+			};
+
+			qup_spi11_data_clk: qup-spi11-data-clk-state {
+				pins = "gpio44", "gpio45", "gpio46";
+				function = "qup13";
+			};
+
+			qup_uart11_cts: qup-uart11-cts-state {
+				pins = "gpio44";
+				function = "qup13";
+			};
+
+			qup_uart11_rts: qup-uart11-rts-state {
+				pins = "gpio45";
+				function = "qup13";
+			};
+
+			qup_uart11_tx: qup-uart11-tx-state {
+				pins = "gpio46";
+				function = "qup13";
+			};
+
+			dp_hot_plug_det: dp-hot-plug-det-state {
+				pins = "gpio47";
+				function = "dp_hot";
+			};
+
+			qup_spi11_cs: qup-spi11-cs-state {
+				pins = "gpio47";
+				function = "qup13";
+			};
+
+			qup_spi11_cs_gpio: qup-spi11-cs-gpio-state {
+				pins = "gpio47";
+				function = "gpio";
+			};
+
+			qup_uart11_rx: qup-uart11-rx-state {
+				pins = "gpio47";
+				function = "qup13";
+			};
+
+			qup_i2c12_data_clk: qup-i2c12-data-clk-state {
+				pins = "gpio48", "gpio49";
+				function = "qup14";
+			};
+
+			qup_spi12_data_clk: qup-spi12-data-clk-state {
+				pins = "gpio48", "gpio49", "gpio50";
+				function = "qup14";
+			};
+
+			qup_uart12_cts: qup-uart12-cts-state {
+				pins = "gpio48";
+				function = "qup14";
+			};
+
+			qup_uart12_rts: qup-uart12-rts-state {
+				pins = "gpio49";
+				function = "qup14";
+			};
+
+			qup_uart12_tx: qup-uart12-tx-state {
+				pins = "gpio50";
+				function = "qup14";
+			};

I understand and support the intention to keep this change non-functional,
but this pad "gpio50" is for qup16 also, right?

Similarly pads "gpio54"/"gpio55" for qup14 function, "gpio62"/"gpio63"
for qup16 function, I find all of these are missing on the original list.

+
+			qup_spi12_cs: qup-spi12-cs-state {
+				pins = "gpio51";
+				function = "qup14";
+			};
+
+			qup_spi12_cs_gpio: qup-spi12-cs-gpio-state {
+				pins = "gpio51";
+				function = "gpio";
+			};
+
+			qup_uart12_rx: qup-uart12-rx-state {
+				pins = "gpio51";
+				function = "qup14";
+			};
+
+			qup_i2c13_data_clk: qup-i2c13-data-clk-state {
+				pins = "gpio52", "gpio53";
+				function = "qup15";
+			};
+
+			qup_spi13_data_clk: qup-spi13-data-clk-state {
+				pins = "gpio52", "gpio53", "gpio54";
+				function = "qup15";
+			};
+
+			qup_uart13_cts: qup-uart13-cts-state {
+				pins = "gpio52";
+				function = "qup15";
+			};
+
+			qup_uart13_rts: qup-uart13-rts-state {
+				pins = "gpio53";
+				function = "qup15";
+			};
+
+			qup_uart13_tx: qup-uart13-tx-state {
+				pins = "gpio54";
+				function = "qup15";
+			};
+
+			qup_spi13_cs: qup-spi13-cs-state {
+				pins = "gpio55";
+				function = "qup15";
+			};
+
+			qup_spi13_cs_gpio: qup-spi13-cs-gpio-state {
+				pins = "gpio55";
+				function = "gpio";
+			};
+
+			qup_uart13_rx: qup-uart13-rx-state {
+				pins = "gpio55";
+				function = "qup15";
+			};
+
+			qup_i2c14_data_clk: qup-i2c14-data-clk-state {
+				pins = "gpio56", "gpio57";
+				function = "qup16";
+			};
+
+			qup_spi14_data_clk: qup-spi14-data-clk-state {
+				pins = "gpio56", "gpio57", "gpio58";
+				function = "qup16";
+			};
+
+			qup_uart14_cts: qup-uart14-cts-state {
+				pins = "gpio56";
+				function = "qup16";
+			};
+
+			qup_uart14_rts: qup-uart14-rts-state {
+				pins = "gpio57";
+				function = "qup16";
+			};
+
+			qup_uart14_tx: qup-uart14-tx-state {
+				pins = "gpio58";
+				function = "qup16";
+			};
+
+			qup_spi14_cs: qup-spi14-cs-state {
+				pins = "gpio59";
+				function = "qup16";
+			};
+
+			qup_spi14_cs_gpio: qup-spi14-cs-gpio-state {
+				pins = "gpio59";
+				function = "gpio";
+			};
+
+			qup_uart14_rx: qup-uart14-rx-state {
+				pins = "gpio59";
+				function = "qup16";
+			};
+
+			edp_hot_plug_det: edp-hot-plug-det-state {
+				pins = "gpio60";
+				function = "edp_hot";
+			};
+
+			qup_i2c15_data_clk: qup-i2c15-data-clk-state {
+				pins = "gpio60", "gpio61";
+				function = "qup17";
+			};
+
+			qup_spi15_data_clk: qup-spi15-data-clk-state {
+				pins = "gpio60", "gpio61", "gpio62";
+				function = "qup17";
+			};
+
+			qup_uart15_cts: qup-uart15-cts-state {
+				pins = "gpio60";
+				function = "qup17";
+			};
+
+			qup_uart15_rts: qup-uart15-rts-state {
+				pins = "gpio61";
+				function = "qup17";
+			};
+
+			qup_uart15_tx: qup-uart15-tx-state {
+				pins = "gpio62";
+				function = "qup17";
+			};
+
+			qup_spi15_cs: qup-spi15-cs-state {
+				pins = "gpio63";
+				function = "qup17";
+			};
+
+			qup_spi15_cs_gpio: qup-spi15-cs-gpio-state {
+				pins = "gpio63";
+				function = "gpio";
+			};
+
+			qup_uart15_rx: qup-uart15-rx-state {
+				pins = "gpio63";
+				function = "qup17";
+			};
+
  			cam_mclk3_default: cam-mclk3-default-state {
  				pins = "gpio67";
  				function = "cam_mclk";
@@ -5898,24 +6568,14 @@ cci3_sleep: cci3-sleep-state {
  				bias-pull-down;
  			};
  
-			dp_hot_plug_det: dp-hot-plug-det-state {
-				pins = "gpio47";
-				function = "dp_hot";
+			pcie1_clkreq_n: pcie1-clkreq-n-state {
+				pins = "gpio79";
+				function = "pcie1_clkreqn";
  			};
  
-			edp_hot_plug_det: edp-hot-plug-det-state {
-				pins = "gpio60";
-				function = "edp_hot";
-			};
-
-			mi2s0_data0: mi2s0-data0-state {
-				pins = "gpio98";
-				function = "mi2s0_data0";
-			};
-
-			mi2s0_data1: mi2s0-data1-state {
-				pins = "gpio99";
-				function = "mi2s0_data1";
+			pcie0_clkreq_n: pcie0-clkreq-n-state {
+				pins = "gpio88";
+				function = "pcie0_clkreqn";
  			};
  
  			mi2s0_mclk: mi2s0-mclk-state {
@@ -5928,696 +6588,36 @@ mi2s0_sclk: mi2s0-sclk-state {
  				function = "mi2s0_sck";
  			};
  
+			mi2s0_data0: mi2s0-data0-state {
+				pins = "gpio98";
+				function = "mi2s0_data0";
+			};
+
+			mi2s0_data1: mi2s0-data1-state {
+				pins = "gpio99";
+				function = "mi2s0_data1";
+			};
+
  			mi2s0_ws: mi2s0-ws-state {
  				pins = "gpio100";
  				function = "mi2s0_ws";
  			};
  
-			mi2s1_data0: mi2s1-data0-state {
-				pins = "gpio107";
-				function = "mi2s1_data0";
-			};
-
  			mi2s1_sclk: mi2s1-sclk-state {
  				pins = "gpio106";
  				function = "mi2s1_sck";
  			};
  
+			mi2s1_data0: mi2s1-data0-state {
+				pins = "gpio107";
+				function = "mi2s1_data0";
+			};
+
  			mi2s1_ws: mi2s1-ws-state {
  				pins = "gpio108";
  				function = "mi2s1_ws";
  			};
  
-			pcie0_clkreq_n: pcie0-clkreq-n-state {
-				pins = "gpio88";
-				function = "pcie0_clkreqn";
-			};
-
-			pcie1_clkreq_n: pcie1-clkreq-n-state {
-				pins = "gpio79";
-				function = "pcie1_clkreqn";
-			};
-
-			qspi_clk: qspi-clk-state {
-				pins = "gpio14";
-				function = "qspi_clk";
-			};
-
-			qspi_cs0: qspi-cs0-state {
-				pins = "gpio15";
-				function = "qspi_cs";
-			};
-
-			qspi_cs1: qspi-cs1-state {
-				pins = "gpio19";
-				function = "qspi_cs";
-			};
-
-			qspi_data0: qspi-data0-state {
-				pins = "gpio12";
-				function = "qspi_data";
-			};
-
-			qspi_data1: qspi-data1-state {
-				pins = "gpio13";
-				function = "qspi_data";
-			};
-
-			qspi_data23: qspi-data23-state {
-				pins = "gpio16", "gpio17";
-				function = "qspi_data";
-			};
-
-			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
-				pins = "gpio0", "gpio1";
-				function = "qup00";
-			};
-
-			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
-				pins = "gpio4", "gpio5";
-				function = "qup01";
-			};
-
-			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
-				pins = "gpio8", "gpio9";
-				function = "qup02";
-			};
-
-			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
-				pins = "gpio12", "gpio13";
-				function = "qup03";
-			};
-
-			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
-				pins = "gpio16", "gpio17";
-				function = "qup04";
-			};
-
-			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
-				pins = "gpio20", "gpio21";
-				function = "qup05";
-			};
-
-			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
-				pins = "gpio24", "gpio25";
-				function = "qup06";
-			};
-
-			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
-				pins = "gpio28", "gpio29";
-				function = "qup07";
-			};
-
-			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
-				pins = "gpio32", "gpio33";
-				function = "qup10";
-			};
-
-			qup_i2c9_data_clk: qup-i2c9-data-clk-state {
-				pins = "gpio36", "gpio37";
-				function = "qup11";
-			};
-
-			qup_i2c10_data_clk: qup-i2c10-data-clk-state {
-				pins = "gpio40", "gpio41";
-				function = "qup12";
-			};
-
-			qup_i2c11_data_clk: qup-i2c11-data-clk-state {
-				pins = "gpio44", "gpio45";
-				function = "qup13";
-			};
-
-			qup_i2c12_data_clk: qup-i2c12-data-clk-state {
-				pins = "gpio48", "gpio49";
-				function = "qup14";
-			};
-
-			qup_i2c13_data_clk: qup-i2c13-data-clk-state {
-				pins = "gpio52", "gpio53";
-				function = "qup15";
-			};
-
-			qup_i2c14_data_clk: qup-i2c14-data-clk-state {
-				pins = "gpio56", "gpio57";
-				function = "qup16";
-			};
-
-			qup_i2c15_data_clk: qup-i2c15-data-clk-state {
-				pins = "gpio60", "gpio61";
-				function = "qup17";
-			};
-
-			qup_spi0_data_clk: qup-spi0-data-clk-state {
-				pins = "gpio0", "gpio1", "gpio2";
-				function = "qup00";
-			};
-
-			qup_spi0_cs: qup-spi0-cs-state {
-				pins = "gpio3";
-				function = "qup00";
-			};
-
-			qup_spi0_cs_gpio: qup-spi0-cs-gpio-state {
-				pins = "gpio3";
-				function = "gpio";
-			};
-
-			qup_spi1_data_clk: qup-spi1-data-clk-state {
-				pins = "gpio4", "gpio5", "gpio6";
-				function = "qup01";
-			};
-
-			qup_spi1_cs: qup-spi1-cs-state {
-				pins = "gpio7";
-				function = "qup01";
-			};
-
-			qup_spi1_cs_gpio: qup-spi1-cs-gpio-state {
-				pins = "gpio7";
-				function = "gpio";
-			};
-
-			qup_spi2_data_clk: qup-spi2-data-clk-state {
-				pins = "gpio8", "gpio9", "gpio10";
-				function = "qup02";
-			};
-
-			qup_spi2_cs: qup-spi2-cs-state {
-				pins = "gpio11";
-				function = "qup02";
-			};
-
-			qup_spi2_cs_gpio: qup-spi2-cs-gpio-state {
-				pins = "gpio11";
-				function = "gpio";
-			};
-
-			qup_spi3_data_clk: qup-spi3-data-clk-state {
-				pins = "gpio12", "gpio13", "gpio14";
-				function = "qup03";
-			};
-
-			qup_spi3_cs: qup-spi3-cs-state {
-				pins = "gpio15";
-				function = "qup03";
-			};
-
-			qup_spi3_cs_gpio: qup-spi3-cs-gpio-state {
-				pins = "gpio15";
-				function = "gpio";
-			};
-
-			qup_spi4_data_clk: qup-spi4-data-clk-state {
-				pins = "gpio16", "gpio17", "gpio18";
-				function = "qup04";
-			};
-
-			qup_spi4_cs: qup-spi4-cs-state {
-				pins = "gpio19";
-				function = "qup04";
-			};
-
-			qup_spi4_cs_gpio: qup-spi4-cs-gpio-state {
-				pins = "gpio19";
-				function = "gpio";
-			};
-
-			qup_spi5_data_clk: qup-spi5-data-clk-state {
-				pins = "gpio20", "gpio21", "gpio22";
-				function = "qup05";
-			};
-
-			qup_spi5_cs: qup-spi5-cs-state {
-				pins = "gpio23";
-				function = "qup05";
-			};
-
-			qup_spi5_cs_gpio: qup-spi5-cs-gpio-state {
-				pins = "gpio23";
-				function = "gpio";
-			};
-
-			qup_spi6_data_clk: qup-spi6-data-clk-state {
-				pins = "gpio24", "gpio25", "gpio26";
-				function = "qup06";
-			};
-
-			qup_spi6_cs: qup-spi6-cs-state {
-				pins = "gpio27";
-				function = "qup06";
-			};
-
-			qup_spi6_cs_gpio: qup-spi6-cs-gpio-state {
-				pins = "gpio27";
-				function = "gpio";
-			};
-
-			qup_spi7_data_clk: qup-spi7-data-clk-state {
-				pins = "gpio28", "gpio29", "gpio30";
-				function = "qup07";
-			};
-
-			qup_spi7_cs: qup-spi7-cs-state {
-				pins = "gpio31";
-				function = "qup07";
-			};
-
-			qup_spi7_cs_gpio: qup-spi7-cs-gpio-state {
-				pins = "gpio31";
-				function = "gpio";
-			};
-
-			qup_spi8_data_clk: qup-spi8-data-clk-state {
-				pins = "gpio32", "gpio33", "gpio34";
-				function = "qup10";
-			};
-
-			qup_spi8_cs: qup-spi8-cs-state {
-				pins = "gpio35";
-				function = "qup10";
-			};
-
-			qup_spi8_cs_gpio: qup-spi8-cs-gpio-state {
-				pins = "gpio35";
-				function = "gpio";
-			};
-
-			qup_spi9_data_clk: qup-spi9-data-clk-state {
-				pins = "gpio36", "gpio37", "gpio38";
-				function = "qup11";
-			};
-
-			qup_spi9_cs: qup-spi9-cs-state {
-				pins = "gpio39";
-				function = "qup11";
-			};
-
-			qup_spi9_cs_gpio: qup-spi9-cs-gpio-state {
-				pins = "gpio39";
-				function = "gpio";
-			};
-
-			qup_spi10_data_clk: qup-spi10-data-clk-state {
-				pins = "gpio40", "gpio41", "gpio42";
-				function = "qup12";
-			};
-
-			qup_spi10_cs: qup-spi10-cs-state {
-				pins = "gpio43";
-				function = "qup12";
-			};
-
-			qup_spi10_cs_gpio: qup-spi10-cs-gpio-state {
-				pins = "gpio43";
-				function = "gpio";
-			};
-
-			qup_spi11_data_clk: qup-spi11-data-clk-state {
-				pins = "gpio44", "gpio45", "gpio46";
-				function = "qup13";
-			};
-
-			qup_spi11_cs: qup-spi11-cs-state {
-				pins = "gpio47";
-				function = "qup13";
-			};
-
-			qup_spi11_cs_gpio: qup-spi11-cs-gpio-state {
-				pins = "gpio47";
-				function = "gpio";
-			};
-
-			qup_spi12_data_clk: qup-spi12-data-clk-state {
-				pins = "gpio48", "gpio49", "gpio50";
-				function = "qup14";
-			};
-
-			qup_spi12_cs: qup-spi12-cs-state {
-				pins = "gpio51";
-				function = "qup14";
-			};
-
-			qup_spi12_cs_gpio: qup-spi12-cs-gpio-state {
-				pins = "gpio51";
-				function = "gpio";
-			};
-
-			qup_spi13_data_clk: qup-spi13-data-clk-state {
-				pins = "gpio52", "gpio53", "gpio54";
-				function = "qup15";
-			};
-
-			qup_spi13_cs: qup-spi13-cs-state {
-				pins = "gpio55";
-				function = "qup15";
-			};
-
-			qup_spi13_cs_gpio: qup-spi13-cs-gpio-state {
-				pins = "gpio55";
-				function = "gpio";
-			};
-
-			qup_spi14_data_clk: qup-spi14-data-clk-state {
-				pins = "gpio56", "gpio57", "gpio58";
-				function = "qup16";
-			};
-
-			qup_spi14_cs: qup-spi14-cs-state {
-				pins = "gpio59";
-				function = "qup16";
-			};
-
-			qup_spi14_cs_gpio: qup-spi14-cs-gpio-state {
-				pins = "gpio59";
-				function = "gpio";
-			};
-
-			qup_spi15_data_clk: qup-spi15-data-clk-state {
-				pins = "gpio60", "gpio61", "gpio62";
-				function = "qup17";
-			};
-
-			qup_spi15_cs: qup-spi15-cs-state {
-				pins = "gpio63";
-				function = "qup17";
-			};
-
-			qup_spi15_cs_gpio: qup-spi15-cs-gpio-state {
-				pins = "gpio63";
-				function = "gpio";
-			};
-
-			qup_uart0_cts: qup-uart0-cts-state {
-				pins = "gpio0";
-				function = "qup00";
-			};
-
-			qup_uart0_rts: qup-uart0-rts-state {
-				pins = "gpio1";
-				function = "qup00";
-			};
-
-			qup_uart0_tx: qup-uart0-tx-state {
-				pins = "gpio2";
-				function = "qup00";
-			};
-
-			qup_uart0_rx: qup-uart0-rx-state {
-				pins = "gpio3";
-				function = "qup00";
-			};
-
-			qup_uart1_cts: qup-uart1-cts-state {
-				pins = "gpio4";
-				function = "qup01";
-			};
-
-			qup_uart1_rts: qup-uart1-rts-state {
-				pins = "gpio5";
-				function = "qup01";
-			};
-
-			qup_uart1_tx: qup-uart1-tx-state {
-				pins = "gpio6";
-				function = "qup01";
-			};
-
-			qup_uart1_rx: qup-uart1-rx-state {
-				pins = "gpio7";
-				function = "qup01";
-			};
-
-			qup_uart2_cts: qup-uart2-cts-state {
-				pins = "gpio8";
-				function = "qup02";
-			};
-
-			qup_uart2_rts: qup-uart2-rts-state {
-				pins = "gpio9";
-				function = "qup02";
-			};
-
-			qup_uart2_tx: qup-uart2-tx-state {
-				pins = "gpio10";
-				function = "qup02";
-			};
-
-			qup_uart2_rx: qup-uart2-rx-state {
-				pins = "gpio11";
-				function = "qup02";
-			};
-
-			qup_uart3_cts: qup-uart3-cts-state {
-				pins = "gpio12";
-				function = "qup03";
-			};
-
-			qup_uart3_rts: qup-uart3-rts-state {
-				pins = "gpio13";
-				function = "qup03";
-			};
-
-			qup_uart3_tx: qup-uart3-tx-state {
-				pins = "gpio14";
-				function = "qup03";
-			};
-
-			qup_uart3_rx: qup-uart3-rx-state {
-				pins = "gpio15";
-				function = "qup03";
-			};
-
-			qup_uart4_cts: qup-uart4-cts-state {
-				pins = "gpio16";
-				function = "qup04";
-			};
-
-			qup_uart4_rts: qup-uart4-rts-state {
-				pins = "gpio17";
-				function = "qup04";
-			};
-
-			qup_uart4_tx: qup-uart4-tx-state {
-				pins = "gpio18";
-				function = "qup04";
-			};
-
-			qup_uart4_rx: qup-uart4-rx-state {
-				pins = "gpio19";
-				function = "qup04";
-			};
-
-			qup_uart5_tx: qup-uart5-tx-state {
-				pins = "gpio22";
-				function = "qup05";
-			};
-
-			qup_uart5_rx: qup-uart5-rx-state {
-				pins = "gpio23";
-				function = "qup05";
-			};
-
-			qup_uart6_cts: qup-uart6-cts-state {
-				pins = "gpio24";
-				function = "qup06";
-			};
-
-			qup_uart6_rts: qup-uart6-rts-state {
-				pins = "gpio25";
-				function = "qup06";
-			};
-
-			qup_uart6_tx: qup-uart6-tx-state {
-				pins = "gpio26";
-				function = "qup06";
-			};
-
-			qup_uart6_rx: qup-uart6-rx-state {
-				pins = "gpio27";
-				function = "qup06";
-			};
-
-			qup_uart7_cts: qup-uart7-cts-state {
-				pins = "gpio28";
-				function = "qup07";
-			};
-
-			qup_uart7_rts: qup-uart7-rts-state {
-				pins = "gpio29";
-				function = "qup07";
-			};
-
-			qup_uart7_tx: qup-uart7-tx-state {
-				pins = "gpio30";
-				function = "qup07";
-			};
-
-			qup_uart7_rx: qup-uart7-rx-state {
-				pins = "gpio31";
-				function = "qup07";
-			};
-
-			qup_uart8_cts: qup-uart8-cts-state {
-				pins = "gpio32";
-				function = "qup10";
-			};
-
-			qup_uart8_rts: qup-uart8-rts-state {
-				pins = "gpio33";
-				function = "qup10";
-			};
-
-			qup_uart8_tx: qup-uart8-tx-state {
-				pins = "gpio34";
-				function = "qup10";
-			};
-
-			qup_uart8_rx: qup-uart8-rx-state {
-				pins = "gpio35";
-				function = "qup10";
-			};
-
-			qup_uart9_cts: qup-uart9-cts-state {
-				pins = "gpio36";
-				function = "qup11";
-			};
-
-			qup_uart9_rts: qup-uart9-rts-state {
-				pins = "gpio37";
-				function = "qup11";
-			};
-
-			qup_uart9_tx: qup-uart9-tx-state {
-				pins = "gpio38";
-				function = "qup11";
-			};
-
-			qup_uart9_rx: qup-uart9-rx-state {
-				pins = "gpio39";
-				function = "qup11";
-			};
-
-			qup_uart10_cts: qup-uart10-cts-state {
-				pins = "gpio40";
-				function = "qup12";
-			};
-
-			qup_uart10_rts: qup-uart10-rts-state {
-				pins = "gpio41";
-				function = "qup12";
-			};
-
-			qup_uart10_tx: qup-uart10-tx-state {
-				pins = "gpio42";
-				function = "qup12";
-			};
-
-			qup_uart10_rx: qup-uart10-rx-state {
-				pins = "gpio43";
-				function = "qup12";
-			};
-
-			qup_uart11_cts: qup-uart11-cts-state {
-				pins = "gpio44";
-				function = "qup13";
-			};
-
-			qup_uart11_rts: qup-uart11-rts-state {
-				pins = "gpio45";
-				function = "qup13";
-			};
-
-			qup_uart11_tx: qup-uart11-tx-state {
-				pins = "gpio46";
-				function = "qup13";
-			};
-
-			qup_uart11_rx: qup-uart11-rx-state {
-				pins = "gpio47";
-				function = "qup13";
-			};
-
-			qup_uart12_cts: qup-uart12-cts-state {
-				pins = "gpio48";
-				function = "qup14";
-			};
-
-			qup_uart12_rts: qup-uart12-rts-state {
-				pins = "gpio49";
-				function = "qup14";
-			};
-
-			qup_uart12_tx: qup-uart12-tx-state {
-				pins = "gpio50";
-				function = "qup14";
-			};
-
-			qup_uart12_rx: qup-uart12-rx-state {
-				pins = "gpio51";
-				function = "qup14";
-			};
-
-			qup_uart13_cts: qup-uart13-cts-state {
-				pins = "gpio52";
-				function = "qup15";
-			};
-
-			qup_uart13_rts: qup-uart13-rts-state {
-				pins = "gpio53";
-				function = "qup15";
-			};
-
-			qup_uart13_tx: qup-uart13-tx-state {
-				pins = "gpio54";
-				function = "qup15";
-			};
-
-			qup_uart13_rx: qup-uart13-rx-state {
-				pins = "gpio55";
-				function = "qup15";
-			};
-
-			qup_uart14_cts: qup-uart14-cts-state {
-				pins = "gpio56";
-				function = "qup16";
-			};
-
-			qup_uart14_rts: qup-uart14-rts-state {
-				pins = "gpio57";
-				function = "qup16";
-			};
-
-			qup_uart14_tx: qup-uart14-tx-state {
-				pins = "gpio58";
-				function = "qup16";
-			};
-
-			qup_uart14_rx: qup-uart14-rx-state {
-				pins = "gpio59";
-				function = "qup16";
-			};
-
-			qup_uart15_cts: qup-uart15-cts-state {
-				pins = "gpio60";
-				function = "qup17";
-			};
-
-			qup_uart15_rts: qup-uart15-rts-state {
-				pins = "gpio61";
-				function = "qup17";
-			};
-
-			qup_uart15_tx: qup-uart15-tx-state {
-				pins = "gpio62";
-				function = "qup17";
-			};
-
-			qup_uart15_rx: qup-uart15-rx-state {
-				pins = "gpio63";
-				function = "qup17";
-			};
-
  			sdc1_clk: sdc1-clk-state {
  				pins = "sdc1_clk";
  			};


Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
