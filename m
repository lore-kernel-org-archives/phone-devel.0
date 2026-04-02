Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B7D368970
	for <phone-devel@vger.kernel.org>; Thu,  2 Apr 2026 06:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775111950; cv=none; b=oYhWmwTzUkTolwrytQpkeKjjFygecI5ORVJWpGLwfQgr9T5oAjexH6lveU80ahcdsQY+zP6ZzCeO47qAvhGIoieSLdfZdQUOYuSpYlscvUZl9O0fpztyUP0yHNiec58nRSiyFO7hENh8sIGOvnAIUhVV/B8B/rmzTndmK/3cpio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775111950; c=relaxed/simple;
	bh=6sndJc0GBJQmB9Do3SK54gedFQw9+lX80iibDDxFoFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qt7Y3M0zbk0MUnVHAUNb8iEg2byEKdJTDS2j5OzeDKZkTEkVKwgvsI4ff2tvMUfqiYURLwC97/3ULt28DSRVzCm3Fq7gg+bu+9z6lYYLK8joyErZXFCszFdgIe6TtLI98nA/FBEHnsspbba/BJDypLbGnQHoeBnqowlgfj+GDTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=sR4Svr6L; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="sR4Svr6L"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775111946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YHq+H6MH4LbASJLjMcjCQqRRO4xEm/zZrOQ3FUn7dvc=;
	b=sR4Svr6LR2kuZwAeaPTG0o8jplTFL2DFW7S54lrcaLGSxmth2wbUbtXtnJx19giGJhhj2o
	TmuIdsQnxZrEqzOhX94aGVF1qU9sNBOrDXt8kJEPj5Zq6wAqqmL7GdP4IefOVHf4Ey4TCe
	m8sR5xJw5UrDpViJj0jDz3dFyaJTlL0E3EzQZPs6yPiLMMTDmdOe9D0+jFKRNHHMta/X81
	Y1DJIKOzZc8ulYoBZz2i2bUV2roemo/JXgrNUBo6R+F/FwRow+5a8BykG0K3ythEQrUOUb
	KpVwRd0kpAS2KTulYrk9Uv5Bj6g+GkDkXL58Xe9rVAM9mz+cp03McoUegYYZOQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 01 Apr 2026 23:38:31 -0700
Subject: [PATCH v8 04/15] arm64: dts: qcom: sdm845-lg-common: Enable venus
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-judyln-dts-v8-4-7677cfafbc78@postmarketos.org>
References: <20260401-judyln-dts-v8-0-7677cfafbc78@postmarketos.org>
In-Reply-To: <20260401-judyln-dts-v8-0-7677cfafbc78@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775111929; l=563;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=6sndJc0GBJQmB9Do3SK54gedFQw9+lX80iibDDxFoFc=;
 b=B+jTuBQiKed19PjjGDUu1cW67liYSoFo6K7I7EZsyyJrwKTNbbo72jn8UYJSOtCvHw8woM1kP
 6CM7th1uJbLCVacFFY/YLpui16Mc/fGhKDdpwXpO7UUDce4ocf16inn
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Qualcomm video en/de-coder

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 93ed8f240461..87ac41ec2e46 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -580,3 +580,7 @@ &usb_1_qmpphy {
 
 	status = "okay";
 };
+
+&venus {
+	status = "okay";
+};

-- 
2.53.0

