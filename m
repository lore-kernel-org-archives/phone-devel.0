Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596875;
	b=KXTMYamdH3bp0Izuf4yaPYSeeUfSJCT3VedTrNI34qe6Qo/Zpwo/DV4IaOkqZuwU5ELz
	 qWYXOHndI2ZNYcOWbcD2B7GbYVj7UcHToO1R4btlm+EYDWgqyRhUMsdsFGm6YNyZx5dPx
	 HUnPJjy04RoPfDX63WlQwSB9rh/AgCKwSoi0KTCqvH2KCaBRckgZd0g5jjd/XY/NErLnb
	 4uP06w3DGKA7YMIenafwGk5D/1HIIN6m2g6D6QwNI8DwiPRyvNaa7LCFFT21ev5r8UqSU
	 hSYT4l4Gqkvrz8Wx5mrisca8tdVehGueqJ808Wl9Hwx2iCnKqUu3ZMoZUFFxb0qf8qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vksi6xdBiN572U8/PprSF6T1ZcI65MaLXrT+W5UPb/M=;
	b=u3HwMuwHZIzdwh0eYZOIIuDTc2+tVw5Drr7DFVjwQdN3NRmpHhJsgjyXWxpmBX8FWXGh
	 tza5gjnhz3EdsNyis975I8eE5ZVNZQocxKDsxtGNYFwJSXaLVuidS2PLcywa5ccdAA0Oh
	 CZWZrjui4dmwNU0O1RI89uJ2gftGP/jWNiuMbFekEhnWqLLAQ3HzJa03Re2WbHRzh1aEi
	 MhUOdOPOdMN862EppkbBKIgW2AMPoQMTEhR6ltfPE6PxlgYCjyPgG4vmogf/2Z2vfHyqp
	 7qq6jhyOEvkGLs9qWBu4LTPIes3HfUa6T80b3xhUIThGvfLwBi+4MtJfeuvxvAHepmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bFjkGDON;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA32460A2630
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 19:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA32460A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bFjkGDON
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50aaad19fbso62960266b.0
        for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 11:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596873; x=1795201673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vksi6xdBiN572U8/PprSF6T1ZcI65MaLXrT+W5UPb/M=;
        b=bFjkGDONSYnmUt0iBBDN+sBDopI7ikDsKpWVytszNlJgTae66dMDCiRZOAt5mLIY+s
         q1LywO7q27xilrn7scZ4dSAsbplZ1ghm5uDWf5LME2ful/5VEle53jfHvSJBkhpAjd3p
         O+9nm8RHUCbu6LNeCr8PQpqG9uY8s9AZpF+U4RMTeZsdd8Aov0vSFzmueef7+1xwzMpN
         6Q1jCE+2tveXveOZTjlik8Y4wllQipC/oRz/uHHKlYJH44dACS1fR3Hp1oUj628Pt94t
         uRP/PJpDgm9b6n4MM6qAaeWG3cE/6uJDdbnyGzFix+pPxfnA7fCUeAz+2RvCNZu8cGtk
         Yexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596873; x=1795201673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vksi6xdBiN572U8/PprSF6T1ZcI65MaLXrT+W5UPb/M=;
        b=G4WRIo3SZT4p0HZABVxfvFieyJE6NYoT3LMWP8bEWPDbyVEpZFobITPbUT9G6pHMlU
         ZneBnKF36daFACtmpxDumSVZ4pX88egjTyHwYvsp/FYQ1GS4CmUS06ui2854FEheV0zK
         reikt1vhMw3hs8lALaGReDwCdJOkQBNqHUG+hsjHBg6uaBu1YWOR5Uj7c3pZgseYL90c
         z8n7ZRgs/DEgQQj0LnI6RbrKng6zBcZcq64z9N85pyx4yaXriFmqgAjoqZ9TXPPFLeS8
         +gLc6uvT+RwcyCijUkFhYjuAY7JiaDMg7d2Yd94/gEK8GMl8/mohR7uhAQA/qX8y9O8B
         QQQA==
X-Forwarded-Encrypted: i=1; AL+hErGwGSPMDBeG32JqHkL7frgZAZPDZcZmj3cpxvf2e7Vr4C1cnhw0hpWFCAvwjScpeUttH5BQkM+fly05HA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9+kxv2BWEsb+I/d9TM1Fef6sHANtbwt+Nb5eE1rfXW/zsv115u
	QuBkxDdF29PeAUwShFc1eW0xQf6h/P/iyxhHn01blvHhbgN4AXKKpV3j
X-Gm-Gg: AYBFou0sQlDUNWbDeGimgxDvmbfdZj66MDePz/zAJwpeGD2q4pTWShrUuSyFv1IkQJX
	quXNI0TSlXP5WpnZpdSvirV7W6RmsMq1+/bpzXUtbzFOrTV+N040iVCZ3EWxb+Bo2lrH9eOzpIM
	sOkVESCzm4mJcVcgWKyJNbbNBqHVGGqvIQDs7ppEFWFhIPDfg6fJLJ0eWPZPQFFvkuVggbb+R3b
	DDTl5DhgfhKVU1yShz6xLoGloN0l1Eh+XtdqpMokrAMNtYXm0EuSq6Kjq95QwXzyeQR3nCSD0DU
	sy2GpL48huR526vpml4BHqgkp711h6qh8Hj87jA1i+12QVAnjs163RgDop5dwQAddiKPD+WDyc8
	YoyMcsIPN09AUdDwvi5WYJsYx2IRiiQxfKup/Euz0KbCXK6dmxmGgVoRLZPlik3p/kGSGl15zwo
	pk2j0RqqkJ6kThIZEt3321VHNJIqehzW9soDxLwZ9DEdVXfiAqEU6p3jctzs6a66C6su8YSIldw
	JK4epxsceMzmv/GDUN1aocxwQtNBabMGMtAMHy1ULqwLw9ikts6+sEAqlS5CDn75cfjdD8tjf8Z
	F9yt2sOeLDZh5CF7d7bLvoJmZ/08UR7FPYC/gc74adgR+Ducsx47xxUbsOzOcJMOJg==
X-Received: by 2002:a17:906:9fcd:b0:c50:9149:48e4 with SMTP id a640c23a62f3a-c50963db437mr297220766b.11.1794596872956;
        Fri, 13 Nov 2026 11:07:52 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:52 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:05:00 +0300
Subject: [PATCH v2 4/9] watchdog: mediatek: Add support for MT6895
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-initial-mt6895-v2-4-4ab0aa9fa391@gmail.com>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
In-Reply-To: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add the compatible for the watchdog of the MediaTek MT6895 (Dimensity
8000/8100) SoC. Its watchdog registers are the same as on the other
supported SoCs.

The TOPRGU reset layout of MT6895 is not known yet, so the entry has no
match data and no reset controller is registered.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index a210fe1569e4..d8755979021b 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -607,6 +607,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
+	{ .compatible = "mediatek,mt6895-wdt" },
 	{ .compatible = "mediatek,mt7629-wdt", .data = &mt7629_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },

-- 
2.56.0

