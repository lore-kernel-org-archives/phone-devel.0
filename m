Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914A01339B1;
	Tue, 17 Feb 2026 20:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771359960; cv=none; b=NzOLvJQsdX7FBsd2itAHRM9JnmZHhNdFpDTrKjL0D0IEooZLJ6On6UOo1fWpghKdACfYXerxd09jR9CCxuVPZf5aTggQqmQY6dwB6KPdDHO7K9Wzgqbi0VIXtnGqfTNzgmjf1SGb7DrnNDjeaHV9pntI1B4uCVEGEgGJUtOVZbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771359960; c=relaxed/simple;
	bh=V6sjBNNTcTEsO5eShsQ7boXHiEv6kCM9NI3J8S5QTew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aaRYP8EVMOyt5GlI3IXyNKyoPPlLwfpow2OTGJbwJqx4+6F2rRoGrgfCouB5GZ1ozZTAHt9W3OUKt79Z54G6JmCUinGCH+ac3H5EKa2ojl2KmqzDB6NpFJkEcGg/w9gl0rf3P+loEhSrDaCGnCZZq2i+yAeQhu1R1spFNKotCvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7GKYozx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7GKYozx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C173C4CEF7;
	Tue, 17 Feb 2026 20:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771359960;
	bh=V6sjBNNTcTEsO5eShsQ7boXHiEv6kCM9NI3J8S5QTew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7GKYozx94x5Pzo5LOC9fMe0Yj8Y/jBhytJ472w1fs/fPX2c5K6r9NWrgIT5zcNp0
	 Gk58EBzN1meeLr2bF4lV/WRJ8Oq7GmISe7NocB5kcp5UeisZmKZGLYu8sCOBsIj54D
	 zFz0GqqRPV8U3MzHkMnX7M+/su+tfd6EQ8wIMt9dRsk0lBGIDsLVfovPBwFsP9o/3Z
	 JhQ3dpY+GH1pH02gVEjyMeKY0vsBy0a07rEZiioltQYQT1gAd48HYrKfU/0UlWCHzY
	 DgJR6r5dLyKrtOCxN/5JHF94uHlRcfgYT04t/kmDcMfRtQ9Su4VmZPGbTJFQC3/w+i
	 3+cWe+6O5hhSw==
Date: Tue, 17 Feb 2026 21:25:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Holitech
Message-ID: <20260217-tanuki-of-amusing-agility-32b250@quoll>
References: <20260217070121.190108-1-val@packett.cool>
 <20260217070121.190108-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260217070121.190108-2-val@packett.cool>

On Tue, Feb 17, 2026 at 04:00:09AM -0300, Val Packett wrote:
> Jiangxi Holitech Technology Co., Ltd. is a manufacturer of display panels.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

