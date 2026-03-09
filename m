Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAC5426682
	for <phone-devel@vger.kernel.org>; Mon,  9 Mar 2026 22:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773094074; cv=none; b=QjzoJElttn6SoFL8pgE78wr11M0C7JjDksIzfIULA+hZ/Njcty+JHBeJ3Phh7JLb6O9ng/RYE4lzm1yugBaVD5c5gNv+XBhb3nvFvtNdgMW2xhYyufzpraW52/JLKg5l+64nyJSbzYiEMUjeucByrlQwJFxr8JKZqk/BNZXWmnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773094074; c=relaxed/simple;
	bh=mXuEXkQj7Rg4dutsP6ny1KP87NvfEJ0+83zK4pvYZr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSFnijtPwLxs5Jos1Ywn68vAuvhEb6eG1JUEsTE1BrylGTbjOj9vKusum/majOFlsE5y1HrnJQf6KaySe6YEPKPmnllifn+iM8aCZ4RsDIfFe2mYFta4B3TTQoeCGRX1ucJwTrz5uv7veJPRvlLhGsyWJSBoNw1xjVawG9vou8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fQbai9Lc; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fQbai9Lc"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b790af67so5088719f8f.0
        for <phone-devel@vger.kernel.org>; Mon, 09 Mar 2026 15:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773094070; x=1773698870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dk5accODM7ezppgmsEo6ZlVd16xDcQunTBdBDruNkNk=;
        b=fQbai9LcJlrJp7LHta2PUOQaEWQBCKry7hgxgC9IDhjff1qTboyTCcCWWs7KeCC++5
         Lcz6nq+tcIvWdzdKPS5M+oQTIThkzVl9P16wFdMRlHXXOy635XGyDEi+k+PMVTK4ylnF
         6rmvMM2nbRPQORp5zJ61ElHchC9H5EPr1SSBAjemPyU1/urLFN33y1E/OuATk3DGh1oK
         Ak8wVblBAumy7Ek2VtdJNMp/uNa3vgXMjgd6+4oEfWyn8cc+5BFrMSDyfwxV4MvobP7o
         2QpeZnUQ3D6WHb0R+ZI4m+EsKm1osgcJyGMMY5sVM87DmOdvTTC/eaO8g/bwSIGMMYNv
         cQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773094070; x=1773698870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dk5accODM7ezppgmsEo6ZlVd16xDcQunTBdBDruNkNk=;
        b=KldmJAO12uCk4nUgmpXw1r6RlYSz98WB0kWcas03UDs+DF5/4ydMDqryriZNGbLFij
         Uq6kFNKTIPHUv2Bq3KF0E+cQl+dEOixdoCrGLomhW6/4fG688h09LY1LUfLJLEW5kA1j
         mAtZ3rJ4s5nUOEPDJaPLp5h0ynVnX5pVRCQeT/N0wPaoAIeuXT/vBGq5Nz8zCENpQv+x
         xOsXx7s23RHDObRrWodwcadeYkJ91q5Tba3n8Hwi62z/YAJAIgYXRmu+mBS3dfWBRkbq
         h0OjZBvPtKizXEgTixP+2e9icTZC4ViOKENNGRH8yUEQHEdzF9Ih5NO7fAoTWGR4pMNH
         G3Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWGzY9n0UHFda1k1Ee8iR6eBma5ghQuuxTv1AOcgJEaJU+SZ5MXlTpNFGee7C2mnbzOEKshthC0flD68w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZY2J+ndNvcisV3S6dPQKReg5mJWYxh6fpyRe7UN2vdL75CGgd
	8YWxg+R/ZgAeG+Q6Lzlw5a+twlrQF/nDUlPkFMmKFci25NTKs3xZObIdJrHFG8gsRSE=
X-Gm-Gg: ATEYQzzcB6J5jzNtOk3ln6kPc16sHNybP3GEgq6cWfAhBMZf8rbC9pHjabsG71jQqeL
	s/OJn6F1SmuL/MWBkvkn7wPyCgmspv0g0s/EkzaobuUiCmJPnHbvKnt5LVLMzoKLX/6qmsx1OdR
	+1HZaRCy+RJyw/KXA0vT66Of59zEtbE4a6cCi6P+fle9Eg3NXmvfgkz/2pGZ/UnuREBP00FlcQ/
	CfcyM7Ca+0NheI3oHSEqEUsd63PQrHyhtqn8/Jy9xtrfe+84gidpxIL8xEWWHbdoTh0ZoAhUr3u
	cqoZWQzE+elhjiu5R+gqpILOGL94OztdwWSNCdfNdHZrdBzEZZKcvDvWLXg/l8qywK/TMoD7lIV
	RRuihSy3MbF3t6gQ3fHS+PIOdmqYgBOttpxDSPUDSl+phWBITPKxQPD5mgZfTDZFhiYcPorKkU+
	aagZVQojBE/zGZg9t3JtlIS6AzSYyCLN399XE=
X-Received: by 2002:a05:600d:848a:b0:485:3294:fff0 with SMTP id 5b1f17b1804b1-48541a2b9f4mr12097815e9.17.1773094070519;
        Mon, 09 Mar 2026 15:07:50 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4441:1c2c:7aff:fe45:362e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485419c2930sm44011255e9.0.2026.03.09.15.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:07:50 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:07:33 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Paul Adam <adamp@posteo.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add
 initial devicetree
Message-ID: <aa9Epb7MQ0qVFWGO@linaro.org>
References: <20260307-wiko-chuppito-v4-0-325ac66ae338@posteo.de>
 <20260307-wiko-chuppito-v4-3-325ac66ae338@posteo.de>
 <aa6P4rE7d2ftaeAw@linaro.org>
 <aa8__ofJBdMfavbq@MyryksLaptop>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa8__ofJBdMfavbq@MyryksLaptop>

On Mon, Mar 09, 2026 at 09:48:12PM +0000, Paul Adam wrote:
> On 26/03/09 10:16, Stephan Gerhold wrote:
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
> > > new file mode 100644
> > > index 000000000000..d927bae2b208
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
> > > @@ -0,0 +1,315 @@
> > > [...]
> > > +&sound {
> > > +	audio-routing = "AMIC1", "MIC BIAS Internal1",
> > > +		"AMIC2", "MIC BIAS Internal2",
> > > +		"AMIC3", "MIC BIAS Internal1";
> > 
> > Sorry, just noticed this now:
> > 
> > This seems a bit suspicious (I would expect "MIC BIAS Internal3"), have
> > you tested if the secondary microphone works?
> > 
> > Thanks,
> > Stephan
> 
> The secondary microphone does not work yet, neither with Internal1
> nor Internal3.
> 
> In the downstream devicetree its Internal1 for AMIC3.
> 
> Is there a way for me to check which one is correct?
> 

To be absolutely sure, only with the schematic diagram of the board...

Another option would be that the secondary microphone simply does not
exist at all (i.e. there is only one microphone). Any idea if it works
on Android?

If in doubt, it would be better to remove the line for AMIC3.

Thanks,
Stephan
