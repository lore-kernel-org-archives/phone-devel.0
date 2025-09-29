Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513FA238171
	for <phone-devel@vger.kernel.org>; Mon, 29 Sep 2025 05:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759122361; cv=none; b=qRtxq8BlHQ6ORiPoMuyxupV4Mnc3/EOaSS4y1VKYUI4A5dBlBc572U66xA/1unVJz3uzfS9/9X+0Nsi77BWRv+z7wQP6mpsjhbjEeOF5bmYE0fslyhxEWF8vOQVdPN3fxC66fK+Fub7PVl5luFcEkqFO8hBPB3oEzVxCaehDfMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759122361; c=relaxed/simple;
	bh=ShssYzB+D/xHmNhnItSInmq+NE/DCD9H8Lug0nPUm5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bYcZjvb2zUdxsSEVTYjvVc5j2VNG8k+rBG7nfjzW4s+fjAFd//CxbVWHI9oo9uEdjG7dudMtVTBFHsrjxTOllcuI6/+H6wN/7vozgqILU39EPiQv4e1VYAX3XW6c+KtUk7xZYNfTgrMG6hFEWDsd34Fuiost8trZp39lT5ya9Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=OyyKBiuS; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="OyyKBiuS"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1759122357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KfYlA1P/ggFeEDyqYeJ1j6VmmH2BYB0zF7q1edZvxlQ=;
	b=OyyKBiuSugMBsOnmwBjXisFxptY6Zjsh4opMs7FkGZdrqMLXDMndM++IakWh5gc36xka9p
	Ues54dlL5RvXIW2tFKGl0C6GP9IsRf1GaOiouCzOez3kho2+CowFgSwsdJheJcNbFZAbd0
	gQLhqi09Q31yNswh9qWo2Y4lCfIfpNG5KGgnIlXm7eTCDgbDZCz7v+ArI/gBrwbVVSeXRg
	pbOuq4/8txH5UUH9t7SYvHBD1Mm9gaAqBj56eaBW8W25e80dWoyouE4BBlpnS6RMtQUivY
	98pWfDcxvq8Vk2vhVvh2agEoSpHEYwdDidYjsHa7GJAoUqp9rm6miIlXRJariA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 28 Sep 2025 22:05:31 -0700
Subject: [PATCH v3 08/11] arm64: dts: qcom: sdm845-lg-common: Add
 chassis-type
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-judyln-dts-v3-8-b14cf9e9a928@postmarketos.org>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
In-Reply-To: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759122330; l=698;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=ShssYzB+D/xHmNhnItSInmq+NE/DCD9H8Lug0nPUm5k=;
 b=SZrqeP5CVJDW0INvjodWqc01QD8/u3IIxbYar8NLIilQeudqCbPSUJP51Iwy9jM2EgHmIOf+/
 BK/ZWR3chjdCLQUdGu02H+Hj9Tb6lKv4uxvL7Ad0W3LBfuBsqMXqNQb
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

The sdm845-lg devices are all phones, therefore handset chassis

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 2aa8f7d2f80c58b5b1f66d797879c43cd6d4533e..a8c8706f2057d36d5ef4130f11d9ad417f93d575 100644
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
2.51.0

