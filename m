Received: from mail-108-mta35.mxroute.com (mail-108-mta35.mxroute.com [136.175.108.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BE814A088
	for <phone-devel@vger.kernel.org>; Wed,  3 Apr 2024 15:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712156849; cv=none; b=dQrmLmZGdvmU2bSCIxw4xScz0kYRhIJN3SoZ0L4WpWW/13DXvH+WhcE9k4X5hyVdMo/aIB+UwkkA84hXmOFNMk69ibDMkBPXuqvFZn5hU05fSGQwTCwcsGenPrBmqQ/DjoY4tXOyuHJp5NzuAD+/4FjQb6e9c8dUcBXmjhJUMF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712156849; c=relaxed/simple;
	bh=3Laptewi9idxYAPvCcw03AREMUZKkgAIxYIhuwWtPu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qnahe8CEHRYluLCanePPuSUKrRDe1q5xqAODhno66Tpr/juSFVXsN6x3DhrO0o7q8hyqeVCHL+hllmKiENdfXCHcd0cTcSn8xG/b2FgyLBPKTuI09QI2fYgRM/btbjIHy/2OxoYQNbpyXy9dMJMLFg5v96lLQ20UsS3elR4k50U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=PIxmbL3D; arc=none smtp.client-ip=136.175.108.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="PIxmbL3D"
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta35.mxroute.com (ZoneMTA) with ESMTPSA id 18ea4800b1a0003bea.012
 for <phone-devel@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Apr 2024 15:07:18 +0000
X-Zone-Loop: f963a248e571e256eb335524d5d221ba8f7182bbbf1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OQd9ziTB3dSRjnJwf4kFBkxYgfp1dPLFgv0kI44LNjs=; b=PIxmbL3DJYG3DZ5zY61t55Hna6
	3XyBgAtLjMvXuC4dPrLLTfbidR0eDGehPJ09CyohkU3/RGeKLI6jYbsS0koQACOFUF9wR+YrqHkBA
	NKHFfCfyAtLo+UCz11lU0cuieftmGJwJnIZiqAZjO7Q+xo7KNW8K5acHp6dMT+NWGVqQKw4rpudP0
	o7H/jlP1eDK9rClRel/7Cc6vhChiDowxCr5wDdSqzJrBkNCa8hwuOiALWjlh4wUPfY+3IiLMhN/9u
	VK+fxTDLclC7l1YUwsnYPU5EkSx98GBNYRozVm/IA4QRmSG5w1fYJ60CpVzw17/w1LjPrvPLmnaFF
	d2HtUckQ==;
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
	Luis Garcia <git@luigi311.com>
Subject: [PATCH v3 01/25] media: i2c: imx258: Remove unused defines
Date: Wed,  3 Apr 2024 09:03:30 -0600
Message-ID: <20240403150355.189229-2-git@luigi311.com>
In-Reply-To: <20240403150355.189229-1-git@luigi311.com>
References: <20240403150355.189229-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The IMX258_FLL_* defines are unused. Remove them.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Luis Garcia <git@luigi311.com>
---
 drivers/media/i2c/imx258.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index a577afb530b7..2dbafd21dd70 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -29,12 +29,6 @@
 #define IMX258_VTS_30FPS_VGA		0x034c
 #define IMX258_VTS_MAX			0xffff
 
-/*Frame Length Line*/
-#define IMX258_FLL_MIN			0x08a6
-#define IMX258_FLL_MAX			0xffff
-#define IMX258_FLL_STEP			1
-#define IMX258_FLL_DEFAULT		0x0c98
-
 /* HBLANK control - read only */
 #define IMX258_PPL_DEFAULT		5352
 
-- 
2.42.0

