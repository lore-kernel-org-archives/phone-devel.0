Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2353A2877C3;
	Sun,  1 Mar 2026 15:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772380605; cv=none; b=dRetEezUdlAtuqZLvg1VFeV2v9XZ6hu6ZLumVCgyQAf6gL0I/cA3TFP3C8e/zocrujXhyK7RjuSX7CKFKgtwvlpYn+6m9f9klTER7jBbeEu+U1pqoFnNnALM+qHE2j3CyRCXFzrcTJatMcU9xzm52eC8TqQBefRGaksKRFMtVjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772380605; c=relaxed/simple;
	bh=s8thqW1tMuw6RS8tMHJFKMOzNak88Anm0d2RW7dtC98=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lT9As9fVxbIYp2FGoHmFiQq5kSBoQZo2pH9YkdTdnXRQDt3d32EUImTYNW7BwifasRu61rrJibEdA7AQufhG5387duWzjW8m1D26BxvWZZKR8+l8z9ggVisKhldFYmGzV1e2NJnXHWz9NUGPQJaixQJtF5XZg5yxGm0HY49KXFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ipN4sanw; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=yYlCIOVy; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ipN4sanw";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="yYlCIOVy"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1772380518; bh=MDf18aLfDEzotGi13+xMk+M
	9xTF6bTrn7qXQktKULnA=; b=ipN4sanwUBES3Nvi8zGO4fRn/tl7d2mLvgzrzvySvD5RnvxnMw
	c9schmEs7EyfrckP27owPU7B4g8ort+eSEHcyNGmNanDXzj+WjRBt1nvS/730Bbkz5tIpbqfs9J
	u1Cp1ODvKavFmX0r2X097eK4GUiPl0EkUxmfukszcY0X7nKJl2g1gflAB/+f+Hm5vkp1N+DBDJx
	e4J1f/wYPbbIFQBA+XbLIhluy3SQTzvT8YKKOB8aGZwvksv0pDjoU4KBS+TJ19qmaKGylKplost
	/Af2wpFPr2Gu7rjFOkp9CYl57q3Xp1hgnqdVXPvQ4kYN1aLPb3L1Fg3AWHLV1CyrqWg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1772380518; bh=MDf18aLfDEzotGi13+xMk+M
	9xTF6bTrn7qXQktKULnA=; b=yYlCIOVyCF+Jcjc7vNPwCR1pXDsJK2eAa+i8OkW5Cfuq20VKMl
	4jCxeyeDRuC17vDXJpVCmX975bggh/doIjBg==;
From: Aelin Reidel <aelin@mainlining.org>
Subject: [PATCH 0/2] Add SM7450 and SM7450P to socinfo
Date: Sun, 01 Mar 2026 16:55:09 +0100
Message-Id: <20260301-fillmore-socids-v1-0-5a033cd8d0e3@mainlining.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgNtpA5eRRxqm2pArTQggnh3i
 +Mb/n9AuQgrDM0DhS9RyUeFbRsIqz8WRonVQIZ60xmLSbZtz4VRc5Co6F1IMznPRA5qdRZOcv/
 HcXrfD9StLcJhAAAA
X-Change-ID: 20260301-fillmore-socids-a5cfb25ae225
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@mainlining.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Aelin Reidel <aelin@mainlining.org>
X-Mailer: b4 0.14.2

Add the SoC IDs of SM7450 and SM7450P, two SoCs in the fillmore family,
to socinfo.

Signed-off-by: Aelin Reidel <aelin@mainlining.org>
---
Aelin Reidel (2):
      dt-bindings: arm: qcom,ids: Add SoC IDs for SM7450 and SM7450P
      soc: qcom: socinfo: Add SoC IDs for SM7450 and SM7450P

 drivers/soc/qcom/socinfo.c         | 2 ++
 include/dt-bindings/arm/qcom,ids.h | 2 ++
 2 files changed, 4 insertions(+)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-fillmore-socids-a5cfb25ae225

Best regards,
-- 
Aelin Reidel <aelin@mainlining.org>

