Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E6B39E6D9
	for <phone-devel@vger.kernel.org>; Tue, 24 Feb 2026 14:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771943166; cv=none; b=lHHlp6Ec6FWexyBU1a5M5QrwdmO2lhBMRnX2/z4drqbem2wA40l4lu+/6A5S4/Lcd7U9gkb6q03GaAWBuT0fd7fUKl0hZ3x6QrcPFxw5zu96j0OS/pjKPfGxBGsmzpnVFimdLc9sKfe6CFuS0mh1YgdSu/Ld1tKPgn1w5juFx08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771943166; c=relaxed/simple;
	bh=yGF1SihMby5FoTVbeRkf4o0DTwBjNrt7ncyLUn6qLKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwzaiRFttc8YOEFkQiwkojpZ7jjcXg+XrwE7jjm8J2vr5DzddXETkekFkA2OvcfGeKHy/BQWpo8PIjXxv1te90cEYckMbRSrxL84P4Dq9QLwbpk0BUxtgRyeCJ7KAfjP/t6/Fvz/KsQ7F1jomO36/c7JqKE9VNEslPEQ3LALsG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=PLL2Q8o9; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="PLL2Q8o9"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 33865240101
	for <phone-devel@vger.kernel.org>; Tue, 24 Feb 2026 15:26:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1771943163; bh=OqJgJP9gwGvLNHBkbuH7ShAGV/HSthFLMVtrCu4MZp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=PLL2Q8o9jYExfZ/eXVvBNEchQmAXE5clcUb9reZCPEc1JNXbXs1vV5v1m6W2x8eiw
	 KdEKnAnKmItyiJErydZ3k01nlO7TWwlKWmSlFUt3+bNgO8lQXskdUh8f0YbrucTfCJ
	 wNQnwwDW/wWad1CdlkGQYXw9Ietc5zzZ/CxBqE11TQTVsa4jj+y/LBKwI9kc23wGs6
	 ysbDNKQWA0mvcGx5d5g9r5g43nZtDwEBFWX2v0i+NsYMPjNMAjIIO4q+BO6vfBXKRz
	 X/GaZbSPPfwRibO4npyMvxKboABj0ppZFw1nyuAIwB9s1G9cIg6WdVRRtD65V1rTnn
	 IbJ9J4jRx63VQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fL0Q16jsfz6tvs;
	Tue, 24 Feb 2026 15:26:01 +0100 (CET)
Date: Tue, 24 Feb 2026 14:26:02 +0000
From: Paul Adam <adamp@posteo.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add WIKO SAS
Message-ID: <aZ2040a0qgj28JCf@MyryksLaptop>
References: <20260221-wiko-chuppito-v2-0-6336b1b12389@posteo.de>
 <20260221-wiko-chuppito-v2-1-6336b1b12389@posteo.de>
 <20260223-literate-flamingo-of-reading-4deaa5@quoll>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223-literate-flamingo-of-reading-4deaa5@quoll>

On 26/02/23 11:25, Krzysztof Kozlowski wrote:
> On Sat, Feb 21, 2026 at 09:55:39PM +0100, Paul Adam wrote:
> > Wiko is a french smartphone company: https://wiko.com
> 
> Everything in Chinese, so not that much French company. Also footer says
> after translation:
> 
> Copyright © Wuke Terminal Technology (Dongguan) Co., Ltd.
> The main body number of the record: Guangdong ICP No. 2022057930
> 
> so for sure not French.
> 
> Best regards,
> Krzysztof
> 

Whats quite confusing to me is that both "wikomobile" and "wiko" use the brand
name "Wiko" and sell the same phones. 

But since my phone is from the french company, I can change it back to
"wikomobile" and adjust the binding accordingly.

I just want to mention that the offical/legal company name is
"Wiko, société par actions simplifiée" (Wiko, french type of business entity)

Best regards,
Paul
