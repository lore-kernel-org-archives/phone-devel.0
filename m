Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2903C2798
	for <phone-devel@vger.kernel.org>; Fri, 26 Jun 2026 05:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782452255; cv=none; b=I0r2OVOhBEmYxVgtKgOTlyKVHYI0sHpjC1welz7+6nxeUZBC7B5kfhoV5hrlfzUk7G1IPtsZppUr/6B3nH+cy7CReoB2LkJwe5U8mrQ3/+jNlXXchgMqMstMqcw3Hs0zO/3242lAtyERRWnueAmunHsWFCg7cOsf0osspEbWfYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782452255; c=relaxed/simple;
	bh=DaIliwXZnq+xhC6xHv4wSGHImwOEOkUrH0LZfBOCFhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IhdzjeU88RHVfzHW4eOSKpnTBfOOZ3EHwMxi4k3mkEL83CwXQ6JKCtzBu7r6FW2mkPaqL1jLzmy2jor5YNqBEQzGj+Z8HC8P89AFrsrOCJZszzlwlJ9jLMvgI7+4jX/hNTPP6QtbEO/iXDZrqtVo/qAkAf2/++whztmSvvR6d1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4OtvwYE; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4OtvwYE"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-137eb0d76beso892858c88.0
        for <phone-devel@vger.kernel.org>; Thu, 25 Jun 2026 22:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782452253; x=1783057053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KO+dGl8JOZI5P4Y+BNYLE/H+0UT+mgOt+djr4eqcLp0=;
        b=K4OtvwYEUVHFNHV3ogyYU4n7Au2r/1gOwxi+1XO4J5y7mohBUggnsWyZPz0x8tMCAE
         iy1o4T+1IV+DfIGtnR+hv5R+OSJkdZlRb8Bz0nHWFenN868s2qcoD0WlIlKHa4Tni2WU
         ov1LonlYeXY+Kh0BOAZ75uRl/D+WN1sgFlAIFFJkDWZa0t5Y8gI8fhhi8rM1qerRchad
         prncmAUyWm032gKWJhrjEhGIJ6nTQft5iVm1hF1WO4dEWWg9sr71m4rh8jMlmWUhGrJw
         vHrVUbjwsmSnEiF3AAJQJPEZAYqFLOEfjXBuy4YT8ag5GOnqoFHKiR86N/qluum3QLzS
         /LKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782452253; x=1783057053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KO+dGl8JOZI5P4Y+BNYLE/H+0UT+mgOt+djr4eqcLp0=;
        b=lzlfxDGO/Ffb4oB/+2uMgkGYJTDD0dkOLe7CSOUsnGUQ0S9ZsedP/80g7nY/Suh4xg
         nFdn5mjLWRzXibgmLymJRmbhg0M/cH2DSoV9yvM3kzAjjzWIMfickmaMryEuq+5Aqpe/
         eqrJfnrPeF1qcMAZ2v6ayBLwU76sbmlLpMrC549mdDu01dKGd4pAFCTiKkmx8Mw9g/ZP
         mw7B7gwyPlfBZ/ooUkWLbdEZiXciHMzFHLdPgCS8Z6zUK/DGoZEeeskCiXRYpKl+nKHa
         DzmBrpgaFwBEc/XTSW0YE7NK2ZR0mZPvtRPkkvvwYZBPwHhxbquSHPC9uhEMh7FrGrg4
         KFmw==
X-Forwarded-Encrypted: i=1; AFNElJ+bb/ti4u4ZNlzSEF34VsjyGztURDZPDiM5N5+7khUPs4C6UPEwFiwD9BKDf3/v8iE1SJLyFL2PNCebSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRMD6NSpZxKudqRAlmHomUU1JCqLdTZNs6/jHTSh6PHAu5EUC+
	apmsE284+suVJR8KwnzjpBndZyF7+IvHd9SzyRR9DT+ZKCBsSXchnbqC
X-Gm-Gg: AfdE7cm8htXllh7ar5xue/Ry6G9G26kyuCMavf/s/IicwYPECDoYdygV63vothUVIhD
	rWH2rEkFIEHi0RZRCauxojhh9txCLMjdn7YpwDDmSzI5Lkq9OkR4ymsIV+aFwvL4n0Qrj06jBGx
	LVy4bycdU+uZF4d8tF5/0gVzpi9AdbRDHxyUDcZ5s7rZsSZMhQp42bcIerQZefJ40NbzeO9Aapk
	niNYVJMqqUGgeFH6RJv86OuWFZSic6gHsTJtKWfCXsuIaoH2F0zgOYlwVJS/ppm1F+clJPh+wLH
	U1dhxv76unBmV/stUb4gW93MkK1RbTMmoyBQpx9dd1lS6HTCucELiEOvP9a4JuBF1a0EJjTG+sJ
	P9dg6k2kOrx0GnCbrSDsSeW57Den6SpQe7U7kwDibFnrImROElfeNKtFjtDvIGOh8vZiOAhgHnk
	SZvogLshOYAgjHArbW1Qm/tgHVJSI/ppAf1IN0xy4lWao/dTCSmTxTCg==
X-Received: by 2002:a05:7022:120:b0:137:edae:540e with SMTP id a92af1059eb24-139db95a6e7mr4536991c88.6.1782452253331;
        Thu, 25 Jun 2026 22:37:33 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a474:bf4a:4966:8d97])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d912197bsm22472462c88.15.2026.06.25.22.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:37:32 -0700 (PDT)
Date: Thu, 25 Jun 2026 22:37:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Vincent Huang <vincent.huang@tw.synaptics.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: input: syna,rmi4: Document
 syna,rmi4-s3706b
Message-ID: <aj4QEL9o94PityxA@google.com>
References: <20260523-synaptics-rmi4-dt-v2-0-0645122babdc@ixit.cz>
 <20260523-synaptics-rmi4-dt-v2-1-0645122babdc@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523-synaptics-rmi4-dt-v2-1-0645122babdc@ixit.cz>

On Sat, May 23, 2026 at 11:45:34AM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Mostly irrelevant for authentic Synaptics touchscreens, but very important
> for applying workarounds to cheap TS knockoffs.
> 
> These knockoffs work well with the downstream driver, and since the user
> has no way to distinguish them, later in this patch set, we introduce
> workarounds to ensure they function as well as possible.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied, thank you.

-- 
Dmitry
