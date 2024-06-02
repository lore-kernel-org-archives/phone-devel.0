Received: from mail-108-mta102.mxroute.com (mail-108-mta102.mxroute.com [136.175.108.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D18E78C63
	for <phone-devel@vger.kernel.org>; Sun,  2 Jun 2024 20:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717359576; cv=none; b=LOzG9WyCmP+Md8PhCv5oDb3x1ktOhdl1qkkgOe1K9GtMirajwC8BWurZV26yR7QbMEEVnHCuAx2r4VZlQ2K3RY02fYyQV6uVj6Ii/RNxPXQHZkMRYSesgrM25FyggvoTGc+DkIkhJ0VKTD5rLiDTVhlV+jiwZWyV2+Y24aMIY5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717359576; c=relaxed/simple;
	bh=vmDWxnFYVlMeX8mv6XV77VsSX93jJDH21Yu7+jdTofM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ixOrPgBajJ+lHtrwoRWs5pfP5HjQ6CZ8eReu1k7z6X2d9NF/kywc8XzsnL+FpkN68I/AgOSee6NNmtNZunFduVBhZaKDkt1S7FzZ7QfEOhPW8FfnMRrC1VxqdncOMupD0cqvUaO4c0xdZI0qhFhR4QntoYjVopyCgsRVY/2W3uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=SU6NupzX; arc=none smtp.client-ip=136.175.108.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="SU6NupzX"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta102.mxroute.com (ZoneMTA) with ESMTPSA id 18fda9677c0000e2b6.012
 for <phone-devel@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 02 Jun 2024 20:14:05 +0000
X-Zone-Loop: 5d5cd1037c3b29e40a4b59269075b66c5d6fdedefb9e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Jxe1gPtYFCmEVv9eTkE7KcDWNvKsfj2RH86DpQggAUU=; b=SU6NupzXCG/9f+iXmj9c3c45n6
	WzJpgZ2VnmFmM1n1t8W4uJPEncFH3I8L7QuEkmEobRyGhwA9KCxGCgEk2jvy+9WlCYPu1tgaqvOkX
	29YBgbFxmzwuZRRDGOGZaSvIc2vp5UXsdI9EBGlCxqRxDzw60BP79h2KzQe0+4qqIvIRZ7rimWMFT
	uuSUnNHHu7wrwO3oUqwUv3WHp0t95o4USZostWhpzL2D50iZP/AACrahJSE9I1S/1SNCarBKK0JdP
	s51dSTBd3yIzSWqg8BFXEebhU3NHiCWrSmyfxXMJtD4iMV4zr2LccQ5YOuQL+fgXn1K14TxEGZJdG
	rFmYUq0A==;
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
Subject: [PATCH v6 06/23] media: i2c: imx258: Make V4L2_CID_VBLANK configurable.
Date: Sun,  2 Jun 2024 14:13:28 -0600
Message-ID: <20240602201345.328737-7-git@luigi311.com>
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The values and ranges of V4L2_CID_VBLANK are all computed,
so there is no reason for it to be a read only control.
Remove the register values from the mode lists, add the
handler, and remove the read only flag.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Luis Garcia <git@luigi311.com>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/media/i2c/imx258.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 495eaada2945..321b504c6a48 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -30,6 +30,8 @@
 #define IMX258_VTS_30FPS_VGA		0x034c
 #define IMX258_VTS_MAX			0xffff
 
+#define IMX258_REG_VTS			0x0340
+
 /* HBLANK control - read only */
 #define IMX258_PPL_DEFAULT		5352
 
@@ -202,8 +204,6 @@ static const struct imx258_reg mode_4208x3120_regs[] = {
 	{ 0x0114, 0x03 },
 	{ 0x0342, 0x14 },
 	{ 0x0343, 0xE8 },
-	{ 0x0340, 0x0C },
-	{ 0x0341, 0x50 },
 	{ 0x0344, 0x00 },
 	{ 0x0345, 0x00 },
 	{ 0x0346, 0x00 },
@@ -319,8 +319,6 @@ static const struct imx258_reg mode_2104_1560_regs[] = {
 	{ 0x0114, 0x03 },
 	{ 0x0342, 0x14 },
 	{ 0x0343, 0xE8 },
-	{ 0x0340, 0x06 },
-	{ 0x0341, 0x38 },
 	{ 0x0344, 0x00 },
 	{ 0x0345, 0x00 },
 	{ 0x0346, 0x00 },
@@ -436,8 +434,6 @@ static const struct imx258_reg mode_1048_780_regs[] = {
 	{ 0x0114, 0x03 },
 	{ 0x0342, 0x14 },
 	{ 0x0343, 0xE8 },
-	{ 0x0340, 0x03 },
-	{ 0x0341, 0x4C },
 	{ 0x0344, 0x00 },
 	{ 0x0345, 0x00 },
 	{ 0x0346, 0x00 },
@@ -800,6 +796,11 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
 					       BIT(IMX258_HDR_RATIO_MAX));
 		}
 		break;
+	case V4L2_CID_VBLANK:
+		ret = imx258_write_reg(imx258, IMX258_REG_VTS,
+				       IMX258_REG_VALUE_16BIT,
+				       imx258->cur_mode->height + ctrl->val);
+		break;
 	default:
 		dev_info(&client->dev,
 			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
@@ -1174,9 +1175,6 @@ static int imx258_init_controls(struct imx258 *imx258)
 				IMX258_VTS_MAX - imx258->cur_mode->height, 1,
 				vblank_def);
 
-	if (imx258->vblank)
-		imx258->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-
 	imx258->hblank = v4l2_ctrl_new_std(
 				ctrl_hdlr, &imx258_ctrl_ops, V4L2_CID_HBLANK,
 				IMX258_PPL_DEFAULT - imx258->cur_mode->width,
-- 
2.44.0

