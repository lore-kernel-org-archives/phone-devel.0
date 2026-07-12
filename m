Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F166346A14;
	Sun, 12 Jul 2026 03:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783826005; cv=none; b=Tv0DJ8Q8YBNb+k5XG+MftAvXR6do7IKRcoRnsfRt614MMPEkgTnFADrYLM9J41rxk9HFPP+cGFVzTH65jjiiH9+IRpYd1dCG+bUE6IklcLJN2BUC6I8jdx8UuLoTSoT1Fy8pF4URHv9bZ5TZpCWpqt6Y0fuWcpdHlmA0VNUvGgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783826005; c=relaxed/simple;
	bh=CnxT7IX+/QaPvXduAC/yoSfn8VJxlMb0Yx8cduWN740=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oL5zF1KKuBMLoKW6C9K+TLltSXVxxIMcnzQwh/o4l5SuQ3UfPkFPULF08I6AnRj+5ycLQr2pgJ4rLzhNPeaHHXsQZxkOAFqG7WtVsJ5hM3fW55Bo2YfUnCS5VnWXOGfscNfDUd6YytpTvVocFSJzKhI6cCS0s1LF5BcOGEzOw+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uESS+pR3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uESS+pR3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35BF3C2BCF4;
	Sun, 12 Jul 2026 03:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783826004;
	bh=CnxT7IX+/QaPvXduAC/yoSfn8VJxlMb0Yx8cduWN740=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uESS+pR3GAV8aR9X8DeB8g6ApxXOKaOt+6RUs4KP7g67pBbdNyN9MvyTD3A6+Z4r1
	 sKRF9irMt2IAYJ6xBaXa+mQC3ThIqJ+2/WWTlSZdgo7psgkFtYqZOysU0Gz+5WjYXY
	 +9qITov1Edz+LwPQpDxVxuTlN7x/Yw8e5JmuYDPzJuH3ndPyYY0p6RTBphBMqJrxTV
	 n5hsAplLWDvcWJLKOA078DHVmkuAK0fPmmpipqYKkZd6vW0UIFuOAr4r2mV+QjZPnm
	 zVkexYLsIbMbMTi/FnC/5PSmXp37QJhpqpjbGvXs+STMK4mOJoYG+Jf6z+tNPCr+vA
	 ldWrGNA2eh+vg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25522C44501;
	Sun, 12 Jul 2026 03:13:24 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Subject: [PATCH v2 0/2] SM8450 QoL changes (qmp)
Date: Sat, 11 Jul 2026 23:13:16 -0400
Message-Id: <20260711-sm8450-qol-qmp-v2-0-d14353bd6ff4@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02Nyw6CMBBFf4XM2jHtIC9X/odhwWOQGmmhxUZD+
 HcLbFye5NxzF3BsFTu4RgtY9sopowPQKYKmr/SDUbWBgQSlIpMS3ZBfEoGTeeE0jJjEXc1NURf
 EOYTRaLlTnz14Lw927/rJzbxVNqNXbjb2uz96uXlHPCX6j3uJAuOMiTlvu6KtbqM1s9HngaFc1
 /UH0Nswv7oAAAA=
X-Change-ID: 20260711-sm8450-qol-qmp-53fbec9b92e8
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Esteban Urrutia <esteuwu@proton.me>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783826002; l=809;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=CnxT7IX+/QaPvXduAC/yoSfn8VJxlMb0Yx8cduWN740=;
 b=gFTD4IDaLgOS67N2qExQKGIXVwukbZhnviwPA81Xq+PlqE6e/hDwEJe1mLhb86Q01IOMncjPs
 d1IwSV9+EDhCVQ3SFjV4VqECrN9/UQcG/2z8ICawtQtRwsKnR79v1f9
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

These two patches drop qmp_v4_calibrate_dp_phy() and modify a pre-emphasis
table for v4 DP PHYs to match downstream behavior.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
Changes in v2:
- Split series in subseries (dispcc, dts, qmp, smmu)
- Link to v1: https://patch.msgid.link/20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me

---
Esteban Urrutia (2):
      phy: qcom: qmp-combo: Correct pre-emphasis table for QMP v4 DP PHYs
      phy: qcom: qmp-combo: Drop qmp_v4_calibrate_dp_phy

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 33 +------------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)
---
base-commit: 96615101b3caf73612f80a217abb9a0da0effbc7
change-id: 20260711-sm8450-qol-qmp-53fbec9b92e8

Best regards,
--  
Esteban Urrutia <esteuwu@proton.me>


