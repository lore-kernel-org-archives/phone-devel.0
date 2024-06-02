Received: from mail-108-mta10.mxroute.com (mail-108-mta10.mxroute.com [136.175.108.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E52E126F27
	for <phone-devel@vger.kernel.org>; Sun,  2 Jun 2024 20:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717359665; cv=none; b=i20/COaJQexTEjRk+UaD3Z/zVdytXBL41MCBEE/9nM4zWUNZtN78vA4lhzTiMAYGJdYCa1Nma4SG6w+w8Nd3dwsqpWteIm2PqetRkOCx34vH1zmkHi8MgW0wriCTGt9ksPlEWUiWcIEbMVwx7+QXGVhvkUAin4jHOeWY1UKhhzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717359665; c=relaxed/simple;
	bh=JYMoAdAi23Rqjp24EgQA29VoTvbC/LV/zcwHywbUEuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FeMn+YVLQRDV38n/6P8KQQMN1ctcjwCv+GWy1icGcJZ+WxogrffqX3kAynQnewjyATV1YsxDliLJtAVkbR0jjntqjWw9wJLEHnp3lj/7GWx7AAIgS4r8uNf/mMyr/qavs8Nf6nwIy76ZAc3vN+niPoO8Ojlyt9hDXBMC+P1srFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=KLoThVaU; arc=none smtp.client-ip=136.175.108.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="KLoThVaU"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta10.mxroute.com (ZoneMTA) with ESMTPSA id 18fda970331000e2b6.013
 for <phone-devel@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 02 Jun 2024 20:14:40 +0000
X-Zone-Loop: 1647324c75edacd0fd9397102e342c3202dcba8cd4d6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7NXcrc70rKMeNobbsr89/2dWktagLdq0/zNwjdJVzYE=; b=KLoThVaUbxr6nNb4nYxZrXrGIN
	QFiuDvHA3jeHhzLf3YUxW24U3fuaXHIyeHWYp+PduEMjWs13tn1R6fS/kaNfxTDYrIuZTP6YCWWRE
	M2mdOLiins20TuRdipId6Bmx7TvDecW/dXLOYN3m5Y1Jjhxe2OhrNOdhAbkI+DG75At03a1Q+4IcH
	IRX/IHNAxBV3a6k17ptKaC57V2F4o0BPecPQRPZICdjPZj5BKrnHQ4OSXQ7QX1ZwKfvo5SiN68yv6
	KTngAakph8sy/B/2OY4kmlqn10jNz3gcNAeZK9lIBVKbDeIFeqpXQDKZzeYk9hlw/foVOr4U13CHY
	3e+KGmJg==;
From: git@luigi311.com
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pavel@ucw.cz,
	phone-devel@vger.kernel.org,
	Luis Garcia <git@luigi311.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: [PATCH v6 22/23] media: i2c: imx258: Use v4l2_link_freq_to_bitmap helper
Date: Sun,  2 Jun 2024 14:13:44 -0600
Message-ID: <20240602201345.328737-23-git@luigi311.com>
In-Reply-To: <20240602201345.328737-1-git@luigi311.com>
References: <20240602201345.328737-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Luis Garcia <git@luigi311.com>

Use the v4l2_link_freq_to_bitmap() helper to figure out which
driver-supported link freq can be used on a given system.

Signed-off-by: Luis Garcia <git@luigi311.com>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 drivers/media/i2c/imx258.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 671fe176c64c..e9abf6b96aec 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -693,6 +693,7 @@ struct imx258 {
 	/* Current mode */
 	const struct imx258_mode *cur_mode;
 
+	unsigned long link_freq_bitmap;
 	const struct imx258_link_freq_config *link_freq_configs;
 	const s64 *link_freq_menu_items;
 	unsigned int lane_mode_idx;
@@ -1546,6 +1547,17 @@ static int imx258_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	ret = v4l2_link_freq_to_bitmap(&client->dev,
+				       ep.link_frequencies,
+				       ep.nr_of_link_frequencies,
+				       imx258->link_freq_menu_items,
+				       ARRAY_SIZE(link_freq_menu_items_19_2),
+				       &imx258->link_freq_bitmap);
+	if (ret) {
+		dev_err(&client->dev, "Link frequency not supported\n");
+		goto error_endpoint_free;
+	}
+
 	/* Get number of data lanes */
 	switch (ep.bus.mipi_csi2.num_data_lanes) {
 	case 2:
-- 
2.44.0

