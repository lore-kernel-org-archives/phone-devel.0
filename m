Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC6638945A;
	Thu, 19 Mar 2026 02:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888428; cv=none; b=n0Kl2cFYtToURpg6remAFtBI9RTQOpHNzGNbZbsCU3qkxQNHTFssHOrzGFZhPRnFNJcy0euUKZtANcFbGqU/vvul6Byx0AN2V87ar5zv4zdlMpYvjE9UVqAl0ZoPc0z897GWNZoVaTFhqDW+Pk+3+GWQYcGUiV6Brp2S03lejR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888428; c=relaxed/simple;
	bh=Fln3qYyCptT9Fc5dSOUoOr0n68ifjBHJeeobNUxe9hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gDuzmIacwik5QSIBc2zCDz/dJPIZVTy/qxmOWY18kJ25/HacOFgDWJOPOwItJLmh/rBRwDxE06MJg4LMpvPaclzFhLYZLTrt29KFOzA/b/lM9mcuRGVH9EIDk8hSMs6cqr59kiYt5vlBK1Wo/a0Sb4BXPMcqd/5TByYvIlff7so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROEkQuzK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROEkQuzK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3073C19421;
	Thu, 19 Mar 2026 02:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773888428;
	bh=Fln3qYyCptT9Fc5dSOUoOr0n68ifjBHJeeobNUxe9hc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ROEkQuzK0Kbiqnd9kzmaRY/zkeGZgZ8Z/z8m+jZZZzfmmWOCvnL7JSI610uuxb50O
	 w031YlyIyO41kq3R7p8FhX5VL9UzW3Oef23mLm+jGgM9KtX96KQwdd5JCc9FhbtwgL
	 HO0e2KvyBedcdFMaUhoy6TfvoKF58r6DjRQ9KJS/Qk8T/miYMlw0MxvquJEmls1Myw
	 QhCAmjXsq1Q4mVYPTzQjd467qXQ9idQxlx1218slFLu5M84g0WeColA2wEmEj63fvr
	 sO40678NDRB4bUuQCgR3yp1U8gQKOLxtRad0ePuCgb97ea0Gj6fSJma4PCwz90r/sA
	 IRmi42+5ceZsw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] Front camera enablement on Fairphone 5
Date: Wed, 18 Mar 2026 21:46:47 -0500
Message-ID: <177388840386.11529.14159549325064762681.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
References: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 13 Mar 2026 17:00:37 +0100, Luca Weiss wrote:
> Since the Samsung S5KJN1 driver was upstreamed recently, we can enable
> the camera upstream by adding a few bits to dts.
> 
> 

Applied, thanks!

[3/3] arm64: defconfig: Enable S5KJN1 camera sensor
      commit: 48847fea51194edeff7f475f8decba9b2ea95800

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
