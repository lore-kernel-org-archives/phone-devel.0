Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE671E521
	for <phone-devel@vger.kernel.org>; Mon, 24 Feb 2025 00:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740356356; cv=none; b=c1KcA4fNYtji0R+5pBO3WymKoIxlPB20qxkPpzhuOmmI9lRQ9Vd82AP21otGrxOq2ZZLADRZ5S/KEa65pNrGuTVcv+PA06z/dVhDKii2Vkzkuh52W8D4b2KXhSn04gWmSC/MZ1mswuJmxVdR0wY1hIjd1gDE56Hp0uWyD7v648U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740356356; c=relaxed/simple;
	bh=TvIMU489tU78+Iqy04G/wuH4oWe4j+s+mPGK7k5dEH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXx5F8AjUubAC0HjZ3cvl94aBH5U23gRhWUF46Uuc0nxXYa90MWoNqfDLb36X9GCn9QyMZgXw5kDKDu1dBivq/FRuKLoxSKgNKnUdaUUlNlRvNCnkml0mL/aVV2OQ0WbE5s6V8N72Nkm6Le7HFMsEpmatYFgfMuYgTNPYJ1QR9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EK/Tzhxb; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EK/Tzhxb"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5462ea9691cso4260371e87.2
        for <phone-devel@vger.kernel.org>; Sun, 23 Feb 2025 16:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740356352; x=1740961152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GFHN1wB7hAg3BDNRXM4so5q/WzeCPLIz2eBiXH9F1QM=;
        b=EK/TzhxbYtAsKJY3tSqvhgqzZ6rU+4c0mfvY54KhUR/jrEjs32WJ1XvEqyls1W2xBu
         fwqA0kgy2vaFCSPVTHPvzRaftiQHJ1ncDiTS5d92d/EX+Axl7iLoBuTWlhxZPLCxtREo
         mriiwxAa675vD5kgbzr49Q6trTTyjW4IF0QOgnJBi0NWFs/QkTUG7CA+F4JxlkvrWpgs
         pXY+xqnROVn7Mcc4RryRzGVtq5GwkoK3eN9KJRbNwGIRjvXqufabRG9DuHwFm26Rt5n1
         x9vrntVIYzBfelXkgvBjmwSQ7eg0h+Qx2qM9QhCEksLCGGgfpK4uAADhvrknBfDAGWZm
         DbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740356352; x=1740961152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFHN1wB7hAg3BDNRXM4so5q/WzeCPLIz2eBiXH9F1QM=;
        b=lwnwJFXTl+/itxPMTYkT4GVr71o0enHg84M43KL925kBNn2XA0njcBjzTAwboaQ+CJ
         2P4+Y+Xw+Om+whabS+7vP4YwoOHG3isIuidiva0LYDbg5eseX/M/7BDsdMISye6i916C
         uaR3bzx8BJNLS+fGMVF5U1CvPU8kixNSuL8VtZmXNOnqBhLo6QmZXM7nYFMjjzlt4MdL
         9shbAjLKedKQN7rahbpbTUdglrs5+F7RtXy4JkeqOrOTPhPLhUBI0TvJmphkbeAF2DA4
         nn/EQTGw7flv/juDffsbs9xcEn+nwqHraYijPuvdTEvdtARGWsBPNbnJX5Bk54YyohZ/
         9ZeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd1VlKJOZ3xZn+obIl8OUyEthPD6aULH7jzPKMI9VWcQPYjwdn8M8XkFzwj7/22kUyTxoHEHLoHc6VXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmDQbLkGmvpWZuzu+terb8OgeNllK/t0nZQ8xuL5I06fAINayr
	hl+IPQEX7xSh/m+khQpcz8gF6Idv3M3HOh70d0XATbPWCf5IfMk2h0fa/Kb9Bv0=
X-Gm-Gg: ASbGncsGo8oma4EggryonK/l7lQpbpee7qkQpE07BBjjERVLZfAKi92IDshGwZjwjFd
	/3MRYRgBb49PHIN/Nsm6VCEmRvqu0FZgLNQ4R5+OQLL3v4TNa7GQLCR6YrA6Jx9J+BXQfJ8Ig1r
	N8IDANFnm5M3P+BwBZeSAiRSlvhTss0bxLREdb1zI2iQ0k6Xf+7Ve5vKk1jt/5flxFih47SvwTl
	EABQCqx1wYAddtEs2riv5ggal0/5yJ4KZZ4RoGKT4WIL/dZjYzOJcBeCVRAEmgVDMawDwlRH0Jg
	w1RP/n4jiGRmC0uA/9YzYqkPg4bgW+c4nmBEFyNB/WkmaLBTAl+obW9vAVusSnl+BW2mwoiVHHB
	MR5/Mrg==
X-Google-Smtp-Source: AGHT+IEt89JxR/uYuIfY1ZBQGBkgrhGrFGK4rZ9JZp9Dr7u/koPyxNo3xVk8Uth1LpOxlXP3HFhAIg==
X-Received: by 2002:a05:6512:2252:b0:545:3032:5fd4 with SMTP id 2adb3069b0e04-54838edd854mr5253178e87.11.1740356351934;
        Sun, 23 Feb 2025 16:19:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a2e03ef65sm23787381fa.73.2025.02.23.16.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 16:19:10 -0800 (PST)
Date: Mon, 24 Feb 2025 02:19:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sdm632-fairphone-fp3: Move status
 properties last
Message-ID: <qgxtu6quxz2ca7old7mau7rjk3kbhwth4ic4mov6r2fefmpq7w@avznusgv2f3p>
References: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
 <20250222-fp3-remoteprocs-firmware-v1-1-237ed21c334a@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222-fp3-remoteprocs-firmware-v1-1-237ed21c334a@lucaweiss.eu>

On Sat, Feb 22, 2025 at 02:00:47PM +0100, Luca Weiss wrote:
> As is common style nowadays, move the status properties to be the last
> property of a node.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
