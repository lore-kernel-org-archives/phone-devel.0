Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C582B9B7
	for <phone-devel@vger.kernel.org>; Mon, 24 Feb 2025 00:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740356366; cv=none; b=gezDpPKIdqWntpawIJVA9yDHQGfxKomSIp01oomYZxIRde9/fPWViGpQ1OXYtoS5DjLTpW9opod9tQ8t9aPNJwQmUoVCsh3rQapDJcPsY/y3wNuedBbhhywJH9Fp3VFNcqWv3SzTjVr4ijE5PwdJc58+lzDl32M6luJUGEbOuXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740356366; c=relaxed/simple;
	bh=mJRxLtLX96QPS+W09kQbtgthZev7JKYRvBjAfO240g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eN2hLwlVQgfw4SWmdUK7fGt+imgYSMPRygipFWm4JS55qgGbXDJmKjFrd783US08CDQ5LikqJeTW/31Zg+RdKOpSrv6rX91zjd+0zoX00qabrL+E4bzaGJk7OJrZePoTZyIUWixuxtddmtKSKj83RCFuoalMV8rPs0ENVQe2MZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aUlQ1RHl; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aUlQ1RHl"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54622e97753so3569779e87.0
        for <phone-devel@vger.kernel.org>; Sun, 23 Feb 2025 16:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740356363; x=1740961163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R446aIN2RLdqu5QwrgfAwmYyzyFgaoXG1ioytOKBEEU=;
        b=aUlQ1RHlt9cIe9SM5rK4MHnDxjhDD3hDYCFtnTjlqWUso2oJaE4O7dgRWoMsRrEb92
         xNeeGPPynAsCptvxisEjJyNi/fxVBO7epH6r2OHt/MYXRT8fFaNY1/ZrVNFpp6Qjx8F4
         +VZGEuBOzdlWATgncxqNgDUHcjnrzd/icGix9GvEA47xQ7H+BOAv8g46LV9kMDmWGx+x
         FnhKYez/4kKRL+F1SpeXMNXGWovOLphpu2bAdlpHkcJKBmtBZ5v0KPdZCobrNUkCOvG+
         rF3VRQqYhK4Y/bxmM5mashBG5xTZNlo90iWZKhPL+nJSMIy0wSN3jtk87Nhv9hSeyAOQ
         aGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740356363; x=1740961163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R446aIN2RLdqu5QwrgfAwmYyzyFgaoXG1ioytOKBEEU=;
        b=ubJ3q9JzLDDilFA19jc0fBZ/+ADJdvitZrRHpZxkMRoAg3VLNOGu3DLzhWu/x3HhHB
         hQQXqU5habrcFlndaUzLTZlPHt8gdzLzUQnsRe/cpAzXJAbd4unst4t7/0JAOcb4B+JZ
         JmKp/nLXuoLPVgwsKK3fC5RKnYkiHZvJVsCpGc9ehcsxNOBWoefyYw1yPRVb7mdQduAc
         gk13wxzTbeUCYnXHuVteMYZxNCslD+bYl+nI1n6bIy7S0t97yiVPa8Oowg4cJKkkfp8W
         fpKCTy3EvxXB/0kIEvEQO0heJdkoTikGTzaWG90s5NbYOVfAUedjr2DqQfWMb9TKQS2u
         S3tA==
X-Forwarded-Encrypted: i=1; AJvYcCV2eU4AYyGTvjpGoL5Qg8iPAE/JjSnziPwnvadDARLmDD9X3dUAywtVn+pEsVgeo7C6svrJhT0v4cViyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpEWLdARGisb7WsHMEX6f873r7djAQDibO8BOu/G96vEjLVoZk
	g0vzLLdY26e8U2RuiSQFArax8LtXDFB+rbv+6n9dpG3roPjgyRV+hHVAuqYkCMw=
X-Gm-Gg: ASbGncvT2Kp0r9F01N3HWqLkt1YkmYeb1/wXEgVs3fPf/iiPsI6CvZOJ6UfotABqVcS
	F9oKojL6gFWaSbNwMw9AAzGMR39DXfWkT3sd+RlhHv6H0NqqOOppHzwOTfUTMH+oTfweTIMkZ+T
	OyICjUTCTTlGa2jVeJUsRVGI83SNFayy9kdDUfQAXdqesdEYVq/atER5Sj7Ie4GBoPlfNo2TPIL
	P7KD78zAMSYQ//m/lJ5iqndqIDyYrGO7eHMEVOlGr8Gz6gMgqBFL1jBNZg3g6FSsj0QCLbg3qtq
	mz5sFE+aBOjC1HBbIVck0bl+npiICej1ncpjUjIvib7TSMbBWOncil7rBmeQPX0UQW6xYnbhEBl
	zUkQMQQ==
X-Google-Smtp-Source: AGHT+IEpkhmi94KeSpVWykQL8VUd3CBwi10V/U7azWBMHlDu+KWmIDkAfZsUghpQkQNQWo9rzJEtLw==
X-Received: by 2002:a05:6512:3b86:b0:545:4ca:d395 with SMTP id 2adb3069b0e04-54838c56efdmr3781893e87.2.1740356362733;
        Sun, 23 Feb 2025 16:19:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54530df9016sm2710726e87.36.2025.02.23.16.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 16:19:21 -0800 (PST)
Date: Mon, 24 Feb 2025 02:19:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sdm632-fairphone-fp3: Add newlines
 between regulator nodes
Message-ID: <b7atryuxrqqo24q6rg5s3nmt3f54nzayaaipvoekf5yb4zv5bz@57zg7s7qgk2t>
References: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
 <20250222-fp3-remoteprocs-firmware-v1-2-237ed21c334a@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222-fp3-remoteprocs-firmware-v1-2-237ed21c334a@lucaweiss.eu>

On Sat, Feb 22, 2025 at 02:00:48PM +0100, Luca Weiss wrote:
> As is common style nowadays, make sure there's an empty line between
> regulator subnodes.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
