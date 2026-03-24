Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FF638947C
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318100; cv=none; b=jS/7YM48GTBLnLqA3QbylWtERmHN6eP5tujmP92nIrxw0r/VaneRFngIYP09F7iulE3lGiF2Ha/AxUXYENdfWbeBOoTEGZpSHsDQEcaY93Ymzw1jJyT6iO2gEPOtLuevcjO0RXPIIgB+OqnhxgLuBUKmBRKD9wH736beM3mR+Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318100; c=relaxed/simple;
	bh=VrRkrxYIquvIGxqzIl3isWNs2KpVGMt/Fpn60szGvLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hJUk8XTQKOQy7WJhFwOAhgg22ASuPOneo08g6Ma85Girvkrh8T7dxLrVfi8BSQrDcB/LUCUuivquzlh36DujNXN6ImoYGEdZRlp8sWvt0Hg2lpp7AgXZcQouDLRPZnt/decL9TXskwh39Ugq1LLdXlCLA0NrybkdQSH/2itVEZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=mmD1A8an; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="mmD1A8an"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774318097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=63nSH5CiSPt4C68Tm0Zd05SkGc04AMvZDTxstAGPgS4=;
	b=mmD1A8an+IZeQX/dL1/xlhoN41nTJmDhN+L0qKtpdCKbdMwn7h037aYOqFRiPORcwrPKC4
	0JRMdt8Vcp/3L2fWJgE/TqU3NmJnhXmhgWQAoGisBiQohiZVYa9EuDJEd5stNB9jJ0flx4
	e5IezCp1+NTZ9g7lqYjV/aSwmiJL4SHbCcCXmUVqwyP9xPnJe8udWblRXK/9LZAsl5q9RK
	2FcUicPkjrbMJ2tRVrTKY311PO/wCYaRnGb5RerK0h7tEzxNyFPTZHm9cgTFUPmyjfJv1f
	JZNAjjXUR4E9C6084NAxEBnZjJMPOVbQmXhD0aGpb1pcpxqmmTg3z1roycPZ8g==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 23 Mar 2026 19:06:41 -0700
Subject: [PATCH v6 11/15] arm64: dts: qcom: sdm845-lg-common: Add
 chassis-type
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-judyln-dts-v6-11-29d70ca1651c@postmarketos.org>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
In-Reply-To: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774318055; l=770;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=VrRkrxYIquvIGxqzIl3isWNs2KpVGMt/Fpn60szGvLo=;
 b=tBTAC1lCQU3Lbws0V9hXXQvP29tHQZVLP8nmwcsoC3R3UIAKO4eFjUx5mhq2GO9LHq+QDYsgT
 yCN+HC3NXOYCxptfjLz6Dxf1H++8g8zrbGZNF0mX2mjzc4dBaEDan6w
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

The sdm845-lg devices are all phones, therefore handset chassis

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 50668bb73b09..fab5ffb3404f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -28,6 +28,8 @@
 /delete-node/ &wlan_msa_mem;
 
 / {
+	chassis-type = "handset";
+
 	aliases {
 		serial0 = &uart9;
 		serial1 = &uart6;

-- 
2.53.0

