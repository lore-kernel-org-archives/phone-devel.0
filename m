Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F08C27A476;
	Sun, 12 Jul 2026 03:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783826005; cv=none; b=phWZvM7q6n6XNaR1H/sv29hW8fJ7P8YBXLWH5l5JCo8QFEnmLMIlKEXTwJoQvM8DZLJVm3goXYqKSN9GWLjW2WpdlgXClTvglUSxW4GP+h9m6JAUWxZZoXR5j9OKuxSLTTg4e5v18JFHz8kBS5DSGiA8CR5zI2bjLyuGuksS/34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783826005; c=relaxed/simple;
	bh=DKPMlvVzmwc1lG5celyEdrQ0cGNAS6Srx+f2rta+Lic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dSp/XZ0Pcb5Y2YR3hH4E+TUWs3Y/2648IJ2YMJoMgrRHEzOdfy0/Ec4UdXPfl0ngeD2okKBxzah/2HQ+5Ue4YwuenPzjdX2BBh7oDSX0jlC2fkChn3fx8sgzLG973WMFC5GkmnklAklxo57vk+h8YqcdA3Tzzx2KZYSAatS+uq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nYX0lFSd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYX0lFSd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44D10C2BCC9;
	Sun, 12 Jul 2026 03:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783826004;
	bh=DKPMlvVzmwc1lG5celyEdrQ0cGNAS6Srx+f2rta+Lic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nYX0lFSd+ZhEPeU0iTdOcIJPFOwpwYcX9iaZMJSsydM56629yjn/I+bMiJVXZCTJh
	 Lk/u6F2Qu+cC1j+NUeR9/q3R67Do0E3FUBdP2u6QZ6iBZOvTXlOpRjWPzVduTcqPK3
	 XQQVJAdOpUL7CX+TQA7Hdnlo7Xgka1ufhc1NEZrowudhgT7TZ5wunabqS9X12bQG3m
	 Cd/ftCSB+VXOu2zRp1lCR0Hr0LPJyG5hlaRCFLOjocG8K3AEVQYvpJuqdkTATDZGoU
	 j8mhmH8c6BzGKWJviKQDMsZC1s3OdawSQa5aqop1O2XZ8Hmnyki+u0xyG0FC8/cuwu
	 sSMHkiPFKLTcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337EFC44506;
	Sun, 12 Jul 2026 03:13:24 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Sat, 11 Jul 2026 23:13:17 -0400
Subject: [PATCH v2 1/2] phy: qcom: qmp-combo: Correct pre-emphasis table
 for QMP v4 DP PHYs
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-sm8450-qol-qmp-v2-1-d14353bd6ff4@proton.me>
References: <20260711-sm8450-qol-qmp-v2-0-d14353bd6ff4@proton.me>
In-Reply-To: <20260711-sm8450-qol-qmp-v2-0-d14353bd6ff4@proton.me>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783826003; l=858;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=ttOwHTqD5JdqKOp7yycqD22zqZB91giULaJsKWEhUOg=;
 b=okopUU6ct22uAyQBjs0owdIiioEOIrEhqKrIr1KVHvVpz0useNbiGQNX9x27TuH89XfR2pG23
 7yPnCez5FIoC1ydOEbM1E4q+5j5y1JMdAdgi2kpqYLbN9h009Wa+rBM
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

Comparing sm8350 and sm8450 tables, this seems to be a typo.

Fixes: ef14aff107bd ("phy: qcom: com-qmp-combo: add SM8350 & SM8450 support")
Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index cdcfad2e86b1..a72c3b9654ec 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2108,7 +2108,7 @@ static const u8 qmp_dp_v4_pre_emphasis_hbr3_hbr2[4][4] = {
 static const u8 qmp_dp_v4_pre_emphasis_hbr_rbr[4][4] = {
 	{ 0x00, 0x0d, 0x14, 0x1a },
 	{ 0x00, 0x0e, 0x15, 0xff },
-	{ 0x00, 0x0d, 0xff, 0xff },
+	{ 0x00, 0x0e, 0xff, 0xff },
 	{ 0x03, 0xff, 0xff, 0xff }
 };
 

-- 
2.55.0


