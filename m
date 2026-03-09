Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B05236C0AB
	for <phone-devel@vger.kernel.org>; Mon,  9 Mar 2026 21:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773092901; cv=none; b=jlsXRHOSyP9Qu5EyouQJfntUSGE/3a2ZfouSFX0Vu5nKqxvbzNLOT7bhO6+bLEpc/wHR++rpJCkxLIJ+sY3oHHGT4RWZFaKkPrUxr2F5LajjNuUspZQu/6kots0bst6/1q6HS60mh1WvsiBQ0iTCDievDGWKNUK7r+a+hyKAN8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773092901; c=relaxed/simple;
	bh=Z/bBxdgg4opJH+WEukzkydne8BK48a/y2MHhP40fG7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdpoG3fcU1Fz+MdT1RlY1WxbQ2zIHv4xObDlMDcwg5ldOfKB5hepuW6hvU6/5ic3fTSoTrIiHypaWNa5tv48cL7e6iR1P1XrVJnZcefcdh/TD4Gvbvll/XXNy1vvQbm6PQiRckP5KEgYc2vZ9tm6NQGs4WUdb9ETV4sM8J+9JAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=JER//Vo2; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="JER//Vo2"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 8D4B3240101
	for <phone-devel@vger.kernel.org>; Mon,  9 Mar 2026 22:48:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1773092893; bh=mtLdpYSnewA1ZtSxotqVlsMvB8VbpYPD7lzl0A/KmV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:From;
	b=JER//Vo2ALlpu206cwsevOrDb7Ihn1/ws54UaFbGVlEvYCy9RdgNYAqWBnO6BNoD4
	 r6L749ozFTgEIHLU0yrunUfCyLJhh6AOD1yZlF0s1UVCQQKCPvGy8CtMWmQUNuHBC2
	 LasD+QubOleGp/qjRUzwTMTYZeT9yX6FSENWedxnAWu8GpHClOhItr+NNAB7ogrcbz
	 g41GXW4k+M+6+OSIE07eVDyx9lq3spcjzw0562XOscTxZ0GGygPI6UD9db9FQo9+C0
	 JqZo6uPV1nHzuUb4m94WEyCFgOM25T1jnIFJygHOtFCdZFA/GJN7DMYf9CMorcs2GA
	 Iullz/BOogQVA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fV9cC66RBz9rxL;
	Mon,  9 Mar 2026 22:48:11 +0100 (CET)
Date: Mon, 09 Mar 2026 21:48:12 +0000
From: Paul Adam <adamp@posteo.de>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add
 initial devicetree
Message-ID: <aa8__ofJBdMfavbq@MyryksLaptop>
References: <20260307-wiko-chuppito-v4-0-325ac66ae338@posteo.de>
 <20260307-wiko-chuppito-v4-3-325ac66ae338@posteo.de>
 <aa6P4rE7d2ftaeAw@linaro.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa6P4rE7d2ftaeAw@linaro.org>

On 26/03/09 10:16, Stephan Gerhold wrote:
> > diff --git a/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
> > new file mode 100644
> > index 000000000000..d927bae2b208
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
> > @@ -0,0 +1,315 @@
> > [...]
> > +&sound {
> > +	audio-routing = "AMIC1", "MIC BIAS Internal1",
> > +		"AMIC2", "MIC BIAS Internal2",
> > +		"AMIC3", "MIC BIAS Internal1";
> 
> Sorry, just noticed this now:
> 
> This seems a bit suspicious (I would expect "MIC BIAS Internal3"), have
> you tested if the secondary microphone works?
> 
> Thanks,
> Stephan

The secondary microphone does not work yet, neither with Internal1
nor Internal3.

In the downstream devicetree its Internal1 for AMIC3.

Is there a way for me to check which one is correct?

Paul
