Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503376;
	b=VbuamKgt2Y5wEKsDApjo1DGShTjJVyuZaluSC1TDq/GpVjYFlpP7YT6aUqcKzsU5lfe4
	 MqNE1smJS+fOyob5XzcPHibPbiKe9/S21gZVkAaOMPmkZRoEJzpkhvHqCpJhKPqkC8qxR
	 UIW/Iqe8xn04z5ks8BRcyCt3ZjHugzc0xUjEW6AHFfhMAyaVErBEklw7RRUBRyNNXzH4q
	 yMF3nKebLXENGDrGmkf77Gwdc9Kch/F6rlNnY9EiYLXuXJw6TtWmFFLho1JkBXYvAWwwG
	 LJIFsGi7Lo+6uIn0V4BNjkvuHkq/Q0YS2kTaW+b3vOjVFoWyqjHHWWpCGCYmZCIp7mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503376;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KP1JdI3LAGwl+0wH2rIIsGhgKcmcgw/sG8waMUn76dY=;
	b=lTq7cc8hpXs/bA1yfTlRyx9wSWaZTy/jRTsIdIbYhGeRJXV0lgQCTnrmoTSoZd0vcIES
	 UBMi+C2e00PWBB52eBIzpz00SrsXIrUOm30n1nNXQXhm06fqBPfdoHcUJrT3Yscqm4kA3
	 bH6zkFl8nW9pOdIvYqnzNZhhhwvtrMgqy1OmSl7sdaD4FPFuunmktv0Lnob4YbD6RB6Iw
	 vPbR8cOpv0jdyLtBm/h7oJRb/zHQFNa2sejhnYQItotaQyH/+UOIFgZAbeCvCn0n1aEVK
	 9Ig7UYX1+kK1aijNqSQx39wbhm75VyU9EZJisDlGdoPT/uYe3uc8Zf3Vgl5tPYWng7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=F7eXa39Q;
	arc=none smtp.remote-ip=91.218.175.155
Received: from mta0.migadu.com (out-155.mta0.migadu.com [91.218.175.155])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25D5606A32E
	for <phone-devel@vger.kernel.org>; Thu, 12 Nov 2026 17:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B25D5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=F7eXa39Q
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rHBbY6wUiRXUSIKaXV3BHpBvZUXlc1KXuZaN1eMIdp4=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794503374; v=1; x=1795108174;
 b=F7eXa39QL7GO9Vl2RceT7cGbxLQDZn6LP5mOSTmicdPRyEGQO6TxhvJFh/zlDviKZrDob0k7
 M8wBrXzGlXpx0UFORAGxdjc242BuMTPFoq9XPiIIANfQBI7xZLbd4D+Hi/dwzLc0Gi0DynKrcj7
 fdwIFFYP9/OJeRK3RnodAzHrt0DJ2N9oL0BE1b34kLYtH39zmfBArC34uqAL+djSK389RFD1Ky8
 9DhJPkQsvEKnQCFe3hzQ1ZjwyetLxgncuLV23s9a1kLu963ravg87mXTaOJbKjuYQL8Z670/+xD
 4pPYESEKNwyKHhCBeJvwXWyQd8BtC5bybi2TQv0M1WMUQ==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id be20e513b24f0ae8;
	Thu, 12 Nov 2026 17:09:33 +0000
X-Mizu-Trace-ID: be20e513b24f0ae8
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Marc Lainez <marc.lainez@gmail.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] iio: adc: qcom-spmi-adc5: Add ADC5_BAT_THERM_100K_PU
Date: Thu, 12 Nov 2026 14:07:29 -0300
Message-ID: <20261112170841.2189322-4-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112170841.2189322-1-val@packett.cool>
References: <20261112170841.2189322-1-val@packett.cool>
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

Even though it existed in bindings for the longest time,
ADC5_BAT_THERM_100K_PU was never assigned in the driver. Do so.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/iio/adc/qcom-spmi-adc5.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/adc/qcom-spmi-adc5.c b/drivers/iio/adc/qcom-spmi-adc5.c
index d57ba8526e0c..c27ff89429f5 100644
--- a/drivers/iio/adc/qcom-spmi-adc5.c
+++ b/drivers/iio/adc/qcom-spmi-adc5.c
@@ -542,6 +542,8 @@ static const struct adc5_channels adc5_chans_pmic[ADC5_MAX_CHANNEL] = {
 					SCALE_HW_CALIB_DEFAULT)
 	[ADC5_XO_THERM_100K_PU]	= ADC5_CHAN_TEMP("xo_therm", 0,
 					SCALE_HW_CALIB_XOTHERM)
+	[ADC5_BAT_THERM_100K_PU]	= ADC5_CHAN_TEMP("bat_therm", 0,
+					SCALE_HW_CALIB_THERM_100K_PULLUP)
 	[ADC5_BAT_ID_100K_PU]	= ADC5_CHAN_TEMP("bat_id", 0,
 					SCALE_HW_CALIB_DEFAULT)
 	[ADC5_AMUX_THM1_100K_PU] = ADC5_CHAN_TEMP("amux_thm1_100k_pu", 0,
-- 
2.56.0

