Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDD548C3FB;
	Thu,  7 May 2026 20:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186091; cv=none; b=U08nrjsr3pWdS6d9RMfHp6IhQeClkRvGCOdZIBnoFdB+0YeDjqZOlu/Padto871mvFjBJaqsYCixF+zOBKKcT0alnJF1bO1NDA+Ml9yNQpIs0bNP+t4+JjXWSb8ackQXGJlk8ssLuQCwiuF/7MTzp5blEjFMIX9E3HWmZNyk24Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186091; c=relaxed/simple;
	bh=vJpujULvu2R4dMJFierq+vxTCy/9SAK8xjiblP2q/Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KplRJ46953BITNYMsstUqLLKOpMf0g3SlVuaeZ3Wit0KV4BlkbO0MLFWQYlwMlLI6wm2sFk5lr/YBKF6cSbSomqugvdO24FW6Mc35Z4h9T44kXKVgyuzEvB7/+u7fk/UFn+m7q3QPy2vUYYL0eWJ9kBrDxQLmUEcKMxyOtoClS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qGfl1bu1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qGfl1bu1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9461C4AF14;
	Thu,  7 May 2026 20:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186091;
	bh=vJpujULvu2R4dMJFierq+vxTCy/9SAK8xjiblP2q/Vk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qGfl1bu157JKU5AbcGdpkUm7fgOEEytPrGVh/nv/J2eK+wd972mwmHuCK36eirVdY
	 6321CPvhvqEohlsfl210eIwCg9buM8SjFepn6S+Q+mwXpaR7yy3vLqP4T3ATy3E/d0
	 B9fE8Z0zWqInSINMgDqlu/6M9g7V9psDtMI6cFp/2ZG4kWqyDSwWYLng+wOPViFztB
	 ldpAotq4WRv+LufQaur9NLIOqZGJYBemGCzyL8OP9gvnraGtF1W0EMMxTzERR7i7wD
	 LIrT+aawAmwc1kIfbwGUAFnLYwqGAlk2OHq2gMbA2xSw6ak10M/zNd8Hx4UN3Xg21R
	 1aduUhmq0fvDg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sam Day <me@samcday.com>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Petr Hodina <petr.hodina@protonmail.com>
Subject: Re: [PATCH v4 0/4] Add framebuffer on Xiaomi Poco F1 and disable the MDSS on tianma panel variant
Date: Thu,  7 May 2026 15:34:17 -0500
Message-ID: <177818606017.73000.3325751231222513886.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402-beryllium-fb-v4-0-46170004da28@ixit.cz>
References: <20260402-beryllium-fb-v4-0-46170004da28@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 02 Apr 2026 00:39:34 +0200, David Heidelberg wrote:
> Enable framebuffer for early console output.
> 
> Due to broken panel driver on tianma and no visual output it's better
> to disable the MDSS so the framebuffer stays on.
> 
> In case second patch gets rejected, please apply the first one standalone
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sdm845-xiaomi-beryllium: Introduce framebuffer
      commit: a4f6959661f0c8542e5a89aaaef27fc4ac9408a6
[2/4] arm64: dts: qcom: sdm845-oneplus: Drop address from framebuffer node
      commit: b379bb1470d864659ae9522b72f241a15255dce6
[3/4] arm64: dts: qcom: sdm845-shift-axolotl: Convert fb to use memory-region
      commit: 15520f868651d6b03c603918bade78f4799df7ca
[4/4] arm64: dts: qcom: sdm845-samsung-starqltechn: Convert fb to use memory-region
      commit: 2eae029f7d38c5fc03a778f483b5079d0e355472

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
