Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443959;
	b=e3qdZWy7P7HFoFhMdgAl756A4HqGSjQlCD+GQA6EDuq/DMR3CD+oguecieCSzFXgoMSi
	 pjn1RRe1MJGTI+vkwe2dHpP3W/kZGJbc/P/z/Nbbee2p8KcpEWqVsXPDw81m+CsDxRGsc
	 s+7Jx4VkjZnZfjDOm99V/0buI1UkHnck98t035qPZ2DPVc0tT/6ATmX7BJxKxrt36R6/N
	 ftbtsSoawcMAHLXG1ItLe+UJwSG+auNvaasFx0z6NDHif9ZjKnVhiK9AN/SGDIJS1+vpe
	 hqcpgQTVkwBVxyAVsNZe+2p3Tf06B3OPmaosP4IoQNhWidhIDj5/kYXuGgXklI/KlrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=uxmsdlRkwXKs6xHOy9xMbMTKjN7AQ/1XvZ4ccJmXMbM=;
	b=jLvMkjAvasAnnpwiCinCEiuR92y6oSJRAz2oMSHoo9OOcefPKlP6PufD/V00eLoVhFva
	 X/fElTA46zJrhSt5iU/TBsTR3bvfTGegbh9ujVYKeXO2y3h70q2kHsMDWpr3+4Xkr5naq
	 AU+hJDyufDohDRDllc7VPE3aSc2tnOt/sBKvX1ly5BoOVxOY1I0vtcjHd1RencBX5Q+IS
	 r+6zJsb6JXSsdFgBdydgdd6cFPkalvUTc50OuXFpkWkwMsqxQPGKfspqYvJGBgymvaREh
	 Fn368YvtT2DI56RLqWopUEVf+xl4fVSq5QiK6q8zU6sX2lm2P5dOja2EPjj/+K/bEZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Wf+xxF8O;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDB4606A333
	for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 14:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BDB4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Wf+xxF8O
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so639505766b.2
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 06:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795443956; x=1796048756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxmsdlRkwXKs6xHOy9xMbMTKjN7AQ/1XvZ4ccJmXMbM=;
        b=Wf+xxF8OO5GuqvnQ2zIev3BeaWER3LI7P8xCIf8fXe+kg6oH3YbTcTloUcLNeFfSU5
         CQYYWREsIe5p+ouwCQfiIlUSLH3FqqLldlcSaLozZbyTEqYne5psCLV2f8YYUW7feAaL
         ASQMIoGHSQTW56eSLRxbTz8omtgd7ivtrZqRE/0QD1/iS3sxGjiXww+i/dwqUivfwUx9
         BrWCq/BoabCXoDfMm37sHq4Gp8f4zcIjWoFYkDUyYlfLH5IFK0Cf5cg/Z+LkNnGc1fmm
         T6/X7IMtij1Y/lAp4XQuWZC9XHiI4rPl0IDR6G534/ukOBys2U4qsZ9wQKym//zhfxsF
         zuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443956; x=1796048756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxmsdlRkwXKs6xHOy9xMbMTKjN7AQ/1XvZ4ccJmXMbM=;
        b=h7De9XZlw0Jv4ZbK+2Gr9PYEXVvK5rEzDY/A9NUVWMKJjfX6WLMnxjkNAOMlLpCcfS
         BNyr+CJ4GMJu+bL1Gqc2Nz9iFZKenS7TUEYAgYMydcjMvB1twVTOWiFTLQdUkV4HtpK9
         OxLPzUkei93SYW/RQf0MzBUt6LfyBmNtsU//bPW++XbCIxlYvFZZWVLuoDYRmIlWzUJH
         0O66t5cc7DuBXZF63ThL0rS3smfdKp8trQNMMxFlZKeGlOZYHv8GFtNkUHHjj158wccg
         2I216Qudyjs81ChSbRfuqB/+blLY5GUjS6U7RJy9N6vLIJj98JyoR4dkGwIIGcjUpsnv
         1xgA==
X-Forwarded-Encrypted: i=1; AL+hErGAs3EPEzP65HK8sEaZjccdn5B/UVh3vjopXN7Q93vWRp+Btt3/GEmRAg/7vFdGEHX+XbaThy5yLed21Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+5nK+2nnZ0RBtAi5tLGFOxV/E0YFD573yLO2VEJ9erB/RlJahN
	qzdYSuTqZZ/B+JO2EioLzGumFDFLB9NQ9kK3e8IbmCgageciDTHYERGwRZHY0OjKz94=
X-Gm-Gg: AZFdTZeQI1qHjJFNgrTkCSrSSRsAwKXTlWMPAcD8N+/iESWUzjSAlzlQAL92vVxJy2p
	VqgjDHcrx6gC7pO2wqduD5CTETQ91bepgZYs1c7HZlHHUlaw9+qzCBX8V0T9TPE4XD/FYr+4+Yk
	HoLI8kYa5pnOkS8cLF6FVznIx0k8FyKA987lkWbbrBy3tElQ19I8bx0emr3mFZU9EUO1HcKfZPk
	3iIUddxizelKUf/Zk2V/qymNw0vq6AF1aQWFGE35BoZ8mImELKmPVwrVAZ7b5YCeIYy2Hkqr0Cn
	Obuytmgfqidr4pvmjFaplowuJ96d0Vot7bPJf5Uf0t1GFSEy18m4JhP9Oc9cMVimFxYC/S6JojO
	uj2YzgZVNiRQm+qr38D6EyxyaA+uhp90uFLewily05ZA8xGCLNzS6AhdjJ7Zf9Cy2dZAHeZ7f/b
	qnEuvXamwD+002xBBfGLDYD863ddJQummZMPmPIVvwmz2Zu/8b77SDsWaEi/S8+b9z7+gZQnmmL
	ra/pgKDq5iSLYOCOeu0xFYblwSGI1bmf4+6smpeUpmLKjRP3o570CgQYsKRpNhoNBsjZwdVXX+h
	4xqfE/tdLCTQnGQj6k0TqraveI1cT4nZ2GVcmb/PcfDvIhu9MMX7g2xDnsHqNqleIFMDk0FyTln
	9n4+uI4DKoywxPALByA==
X-Received: by 2002:a17:907:a890:b0:c41:266:68a7 with SMTP id a640c23a62f3a-c513aacd82cmr967497166b.10.1795443956585;
        Mon, 23 Nov 2026 06:25:56 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae67cbfsm428224366b.14.2026.11.23.06.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:25:56 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 23 Nov 2026 14:25:55 +0000
Subject: [PATCH v2 2/2] phy: exynos5-usbdrd: apply gs101 postlock tuning
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-gs101-usb-phy-orientation-v2-2-3361fa5f7543@linaro.org>
References: <20261123-gs101-usb-phy-orientation-v2-0-3361fa5f7543@linaro.org>
In-Reply-To: <20261123-gs101-usb-phy-orientation-v2-0-3361fa5f7543@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 RD Babiera <rdbabiera@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, phone-devel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

Phy tunings to be applied after lock are never applied on gs101.

On gs101, gs101_tunes_pipe3_postlock[] disables the high-speed squelch
detector when in P3 / U3 to save some power. In U3 (USB3 suspend) there
is no SuperSpeed data traffic to detect, and link wakeup uses LFPS
through a separate low-frequency detector. Disabling the high-speed RX
squelch detector in U3 avoids keeping it powered while the link is
suspended.

Apply PTS_PIPE3_POSTLOCK once the PLL and the CDR have locked.

Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 combo phy (HS & SS)")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index ccaf0f27c4c8..f647688c3bfb 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1745,6 +1745,8 @@ static int exynos5_usbdrd_gs101_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
 	if (ret)
 		return ret;
 
+	exynos5_usbdrd_apply_phy_tunes(phy_drd, PTS_PIPE3_POSTLOCK);
+
 	/*
 	 * Set this while still holding phy_mutex, so that the orientation
 	 * switch callback can't miss an orientation change.

-- 
2.56.1.750.gf70dc682cf-goog

