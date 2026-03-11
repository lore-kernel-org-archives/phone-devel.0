Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537D528A3F2
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 02:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773194580; cv=none; b=ru5Oo/A/1pBvDZS3uPTwyfqRP71XE3F+cJ130FQQ/RjNtcY5f3t8S7WLGaK74/Ww/eK8hwm8kWVYnegczNV0pByuM30y1ktuXQgjkddVjM9Jx5gF5I1rNdtM0oo9rpsMohExeugEoXIiV14cceQqah6lEvKq1HCMq+EvTn5xnW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773194580; c=relaxed/simple;
	bh=7vedanxwL+aX1eYgJ6Asqi7juZBXZ7ygsplulsp3Lys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s1XHKkKIIVBZRLSRBabycC3TkgyvsQf3PmhlG/giceFP+ClwJXmIcStDdvPsQ+G9093FNt0IuxDEdaHTsjXH0KaHyW4yaVcbqExlmYE6bWFuZukKow0/mgOaxN1ixfDPwwKcKrvPeyzXEW5NDjcwNQVtJOMScJCaupeWxjXem8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIQz+pqT; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIQz+pqT"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cd90401034so240441685a.0
        for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 19:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773194577; x=1773799377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b7qBBzlJqLxEpsxZsxYErjEj0j0dE/eer6vWOZDdoAc=;
        b=jIQz+pqTEQS1qaYxZ7LQ1DoPrNvMG/GS++cX/UFlgY1FXjztn2CfgX2IB9wlZlGpII
         yIPn2eXOkgcGW0MBo14Y6kvU++M7SaKm6/44jfO6ezLSfDEM706OJe4+QXayEAZ8YhQ4
         CkwrmzUEKj1ss8RQtS0ui34MLZp+qzTOlUN5KHBTuekEyMkn350vEvSYBsCgXrxS4VD0
         Bhdv41fcA+2sbmqYTsDM78aluGrIZ2icQK10gF3vjP6CJ4BtsIQiKI7s40n69TTkSL1B
         O8CjnsWmnOyjIry7fMWFqnxlikyI60+HNphmfbE+BG32smWpCWuitzntH/dns1abzG6H
         Lxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773194577; x=1773799377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7qBBzlJqLxEpsxZsxYErjEj0j0dE/eer6vWOZDdoAc=;
        b=th2x+1EWJ4V9m+gYZpykkY2q45GaYb3WgvAggn6XjXkBdWBzpIfoajz0KSbDC49dG2
         e+YXmg5mBlNOOluhmMy3nz3aywD+j2o3n7EQtI8dkBzIIXEpgibp81eKajFNvzoSfaCx
         cZAkETpCSBGm/Uqzkd4dxceLf5Sai9WxW5qYefmzs+cKKStx6jF0DJcjE8QnPWApY4zX
         IW85BkhZwL3N0W/kmOMKW6bTwUCDokuQqPcGz+jy+/4FpPezzyU4p2msOOdMNBhR2zob
         fb5Mw58JhtFVMc5jFVrF4o5fMFN2JVA70kxBmfrAH7iEJRtVtU6UePbbcVT0p1Xj6C+d
         W5ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4JNNNg8pisEyCSmwGgHfKZnPIvNQy2usGIyJue5P9xTZxVyTlUt+N85+diaxhsJVqrWK7BUPH9Vom7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj2GxuTDBiRApNnxLrwf37kaEYC8yQZGG65XBapiXVxzrXGgqL
	9oLjhiPfqhesKrtOFQYdRRAZir8C5rIpAaCC4rlWppBd/+cE0WZ+ojSU
X-Gm-Gg: ATEYQzwnsKO9XkUBTpYbnfBbaRIMIEEp5je65G2+WqXtfNkiC0HX34y+E1aK4eGFBAd
	g6oaSxg+L+UoloihIexQT1dvnqjxwjcHTxHY7+ZCWq3W4KxG6PFK2qneREe29QKgN//rz8ICTxa
	RSjT8sSayANMnEiYmgWF+ljANyFmKYIn0gUmMSFKXpxVoNVp+tm7S+rP1H/m82hzVE69PWOcg2Y
	FmmaX01HPiUQM5bfy9pGyRYTbnGchQzvtQtmKtblmNJ5n/mhyJuZ/TsW0XzIGxz0v2FF5VzIsKn
	7E0m/AE6rx00CJe+O6gn+I6hChrlIqln9EPuJmFV9crc+kReS4YINgag9coetJ1GnpQ3K2YnuOy
	HAMfq5CpnhLKSUegD/zfW19CDb0RNKrs7OmfxUmzsLhzqqUIQhl9s/4wDTWmHmXgVX6zKYICyVX
	r7RKUaEuSjVgKaW4yr7ENa8vAcA3QJXLQ1djIa
X-Received: by 2002:a05:620a:2688:b0:8cd:8d79:6c63 with SMTP id af79cd13be357-8cda1ad7ad7mr130659485a.68.1773194577196;
        Tue, 10 Mar 2026 19:02:57 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda2135cccsm42854785a.36.2026.03.10.19.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 19:02:56 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v10] media: i2c: imx355: Restrict data lanes to 4
Date: Tue, 10 Mar 2026 22:03:28 -0400
Message-ID: <20260311020328.57976-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IMX355 sensor driver currently supports having 4 data lanes. There
can't be more or less, so check if the firmware specifies 4 lanes.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Link: https://lore.kernel.org/r/aW3uFcT1zmiF4GUP@kekkonen.localdomain
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
Changes since v9 (https://lore.kernel.org/r/20260217002738.133534-1-mailingradian@gmail.com):
- reject zero data-lanes
- split patch 4/7 from main series

Changes since v8 (https://lore.kernel.org/r/20260210020207.10246-1-mailingradian@gmail.com):
- allow clock-lanes, but make it optional (1/7)

Changes since v7 (https://lore.kernel.org/r/20260117040657.27043-1-mailingradian@gmail.com):
- restrict data-lanes to 4 (4/7)
- include first patch (1/7)
- add back optional data-lanes in bindings (2/7)
- remove assert low on power on again (Bryan's review retained) (3/7)
- use dev_err_probe in power on (3/7)
- remove second error on probe power on (3/7)
- add review tags (2/7, 3/7, 7/7)

Changes since v6 (https://lore.kernel.org/r/20260107043044.92485-1-mailingradian@gmail.com):
- remove NAK from Krzysztof (3/6)
- assert reset GPIO on probe (3/6)
- change delays in reset sequence (3/6)
- remove __maybe_unused from OF match table (3/6)
- fix alignment for arguments to devm_regulator_bulk_get_const (3/6)
- remove front camera pin configuration (6/6)
- remove clock-lanes from camss endpoint (1/6, 6/6)
- remove data-lanes from camera sensor endpoint (2/6, 6/6)
- remove blank line at top of binding (2/6)
- add review tags (2/6, 3/6, 5/6, 6/6)

Changes since v5 (https://lore.kernel.org/r/20260107042451.92048-1-mailingradian@gmail.com):
- add Bryan to CC who added a Reviewed-by

Changes since v4 (https://lore.kernel.org/r/20251211014846.16602-1-mailingradian@gmail.com):
- add NAK from Krzysztof (2/5)
- label the camss ports (3/5, 5/5)
- define endpoint properties correctly (1/5)
- use devm_regulator_bulk_get_const (2/5)
- remove clock-names (1/5, 5/5)
- set reset GPIO as active low (1/5, 2/5, 5/5)
- explicitly drive reset low at start of sequence (2/5)
- make data-lanes in endpoint optional and start at 1 (1/5, 5/5)
- add mclk3 pin (4/5)
- add Reviewed-by's (4/5)

Changes since v3 (https://lore.kernel.org/r/20250905215516.289998-6-mailingradian@gmail.com):
- separate camera mclk pins and move to different patch (4/5, 5/5)
- remove polarity from rear camera pin (5/5)
- remove output-low from front camera pins (5/5)
- mention effects of dcf6fb89e6f7 ("media: qcom: camss: remove a check for unavailable CAMSS endpoint") (3/5)
- specify single clock-name without items nesting (1/5)
- rebase on 49c6ac166cf7 ("media: i2c: imx355: Replace client->dev
  usage") and eaa7d46d9654 ("media: i2c: imx335: Use V4L2 sensor clock
  helper") (2/5)
- do not use of_match_ptr for OF match table (2/5)
- remove redundant GPIO validity checks (2/5)
- describe endpoint data-lanes (1/5)

Changes since v2 (https://lore.kernel.org/r/20250714210227.714841-6-mailingradian@gmail.com):
- use devm_v4l2_sensor_clk_get (2/4)
- require supplies and clock-names (1/4)
- move unevaluatedProperties down (1/4)
- disable clocks as last power-off action (2/4)
- use 0 in gpio pin power-supply (4/4)

Changes since v1 (https://lore.kernel.org/r/20250630225944.320755-7-mailingradian@gmail.com):
- too much to have a complete list (1-4/4)
- squash camera orientation patch (4/4, previously 5/5)
- squash driver changes (2/4, previously 3/5)
- remove labelled endpoint node in sdm670.dtsi (3/4, 4/4)
- change init sequence to match other similar drivers (2/4)
- retrieve clock frequency from devicetree-defined clock (4/4)
- remove clock-frequency from dt-bindings (1/4)
- remove redundant descriptions of child nodes (1/4)
- switch initial drive of the reset GPIO to low (2/4)
- set mclk frequency to 19.2 MHz (4/4)
- add vdda-pll supply for camss (4/4)
- use common power on and off functions (2/4)
- use devm_clk_get_optional (2/4)
- remove extra layer when describing mclk pin (4/4)
- rename regulators (1/4, 2/4, 4/4)

 drivers/media/i2c/imx355.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 9ca87488c933..27a5c212a527 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -66,6 +66,9 @@
 #define IMX355_EXT_CLK			19200000
 #define IMX355_LINK_FREQ_INDEX		0
 
+/* number of data lanes */
+#define IMX355_DATA_LANES		4
+
 struct imx355_reg {
 	u16 address;
 	u8 val;
@@ -1705,6 +1708,9 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
 	if (!cfg)
 		goto out_err;
 
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX355_DATA_LANES)
+		goto out_err;
+
 	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
 				       link_freq_menu_items,
-- 
2.53.0

