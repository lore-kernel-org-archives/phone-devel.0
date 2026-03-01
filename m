Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CC1430BB5;
	Sun,  1 Mar 2026 15:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772380541; cv=none; b=d98ygOQwRSyWDk3l5qmp3o5GkWYoMDQtathmpTv9Hdqho+MK+3nIMoU4T9TCK04Ls8eK1iH0kniHgnDHz8UEmWzbakfBeTLVB9kwMqlcgs9NBDvqQqdk2dSV2nLL85PNcwDhZoV8z3tQke7h4IIldVujpTVm439+zIoVnRDS+co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772380541; c=relaxed/simple;
	bh=RYByP2XvXBUbGN4q1tDiy4fTJoJKEYt0iSF/zCjst3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iGCtm1Ongc2bn4qVOSH/QIXV/uedU7gZHY/gOvVPzqlPc75DUTR0ObWrOaZ3zeuA136Q38u5gUZf8kEM1cBuJZyFDt4ZLbNMhXQam6eKlay9trqQanIMPAdm5Uvu2/i3meXxrrah5WpOQOC5YH5gfUKYdoRHx7dw8Efqk+JbkME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=gK2RAYZ5; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=DHgquC3s; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="gK2RAYZ5";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="DHgquC3s"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772380518; bh=Ri8lJRc0jbyS1+81I3UqbgP
	DoEolq/e6gzqY8KTF5VI=; b=gK2RAYZ5tKJ/6/ZMLYMrASHQmy99/f9vKHSyStI2wond99PQue
	N8aogqAWI5QLGDq091B1IHVD16xD28m4L4/FvuJ/kbh+kVv7h074PQcMNvmxQD4GqDfb+2YUuYz
	yv0rvhXPu/TblxNsBRQdy/iCzhgiounz5L7iviWROHW+2UfLvMv2Q3miSriq3AUBi/sUhnIVgXx
	gkfZfZOrPQFut/qc6UUXR9spL5I9IJsFJIUdkMq5qCgfRu9rg03xGGyA0gQ7M1nq2e53ecLQjEh
	YpUUGHvsA6fpoK8hkXVONQXDQRoaVCSs6vUd0D1U8dMIweoo0LPlhHyvlmIozEqtwqA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772380518; bh=Ri8lJRc0jbyS1+81I3UqbgP
	DoEolq/e6gzqY8KTF5VI=; b=DHgquC3sXUXIg+phiklpLvtjj+IpTP/pW2Y7vYKFqpUjxlVOmg
	5c2HjxcY/bPtefSQg9mseE7ZWZ1OGxmUnzDw==;
From: Aelin Reidel <aelin@mainlining.org>
Date: Sun, 01 Mar 2026 16:55:11 +0100
Subject: [PATCH 2/2] soc: qcom: socinfo: Add SoC IDs for SM7450 and SM7450P
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-fillmore-socids-v1-2-5a033cd8d0e3@mainlining.org>
References: <20260301-fillmore-socids-v1-0-5a033cd8d0e3@mainlining.org>
In-Reply-To: <20260301-fillmore-socids-v1-0-5a033cd8d0e3@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@mainlining.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Aelin Reidel <aelin@mainlining.org>
X-Mailer: b4 0.14.2

SM7450 and SM7450P are two SoCs in the 'fillmore' family.

Signed-off-by: Aelin Reidel <aelin@mainlining.org>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 003a2304d535c2655db566c644342dbc387e24a9..cde2151251f31fe26adbb1ed462c62c75a99f536 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -492,6 +492,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QRU1000) },
 	{ qcom_board_id(SM8475_2) },
 	{ qcom_board_id(QDU1000) },
+	{ qcom_board_id(SM7450P) },
 	{ qcom_board_id(X1E80100) },
 	{ qcom_board_id(SM8650) },
 	{ qcom_board_id(SM4450) },
@@ -508,6 +509,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCM8550) },
 	{ qcom_board_id(SM8750)  },
 	{ qcom_board_id(IPQ5300) },
+	{ qcom_board_id(SM7450) },
 	{ qcom_board_id(SM7635) },
 	{ qcom_board_id(SM6650) },
 	{ qcom_board_id(SM6650P) },

-- 
2.53.0

