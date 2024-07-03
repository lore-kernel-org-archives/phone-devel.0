Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB1A17C7A0
	for <phone-devel@vger.kernel.org>; Wed,  3 Jul 2024 10:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720003407; cv=none; b=Rts/nfb4DWrdrCjFT0xE97UHSI9ieGWAiVsP1mAgBQQ66LQSxzjuumnwDhePqJ5Qjc6VWHkXlDyZMuSJuLsmuxyAG+hfLaSDmRb4KrIuLD7xFHgSBdlg2XNGUtoZ0kBpGUjpekETmB7ytQdnaQCWSndr5yncZHaZRVVJOYjVJPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720003407; c=relaxed/simple;
	bh=2wxWeoN2eQclXzHkcGpowUW3NZvFsYJvCo5CaNFq/eE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3vpwXlO3IyeAF3RF513HVMJTYl2EjpWhKjG8DTRonbZd8NoXGfkFIz9l5DzCC9GohNFMmsLZt9Zp+5SB3Mq+Mr1Oeb3/XNvp0p4G+/p5XKjqjfrKF8ha6a9CMFWT/VNt9WoOSJ437JOh2YCWf02XCuxSojNWpSXWnaOaKpkb4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i16lebZd; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i16lebZd"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52cdf4bc083so7975013e87.2
        for <phone-devel@vger.kernel.org>; Wed, 03 Jul 2024 03:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720003404; x=1720608204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QBebKiAbFSe/AKxcyTneERXqkxEhAYvVNEM7VkxhZlQ=;
        b=i16lebZd4SxtJ91Cj3I2fItsWruqOn9UNE1KoQXAYs3Ca0OZPJ4m8grePTYpLdkQwy
         jcMhIkVz34+nnz9ipL0OkjsQsbW6FUXOEcHQn0qwhLtnE+DiKXqL4hr/wuOPXc57Ix6C
         7dgQc87soRBa9XGeTQli+dP5KG2393kP189FKpi3ck6BZhHMGXlpP6oHB0DZaCzyG9yO
         msBCvNShx4E5lGu+iyITM+Bb/6mHxvClRRJb4cu4pvznRLqNXFb/H5aX/ljGflYoiGzB
         fEsFsXHwHs8KUHMd8002QnFQ1PpVquoM2JDO7/FVX3uYvHciKECOUYJUC97AjhbxqnIg
         DZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720003404; x=1720608204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBebKiAbFSe/AKxcyTneERXqkxEhAYvVNEM7VkxhZlQ=;
        b=agKY1VW2vs+jrXU/CTqETDl1FT9Oe6n1JxxsDARbOfk3Ps76EVqi0rI35R7eUrO5hY
         N4H4VlGR11teVntmA8KCIytW3XlIX8JlAkb56tlHbzW5J1zch1oaAVSsXVA7pumKfvUo
         xNs9YfY7IRGnmp41QnLFl04MbpUkguvO0nex2/7qyPiS90IFXcSG5LGwOfAOQFDtzoXF
         4CyUF4IcywYlRDHJZpjH5ZqCrL3Htn4ILEIOOyxTG9OsbbosF9CWRx+9a2HPVai0lrJP
         fkcshdHroc4fIH9RlEQ/BJXGkcd0+j+SL5PaghBrXs6/k5cHjtalbkpBJVEOaSsXHQvp
         931g==
X-Forwarded-Encrypted: i=1; AJvYcCUox9UW34ZDpb7abzirL+EoN0YOWFZRWm9Kbkddblbofz0bxtK8XBeKToEMziJ80/OEiYTlLZsIZoBQ4e2YtAR+3x00jELOasPhgRo=
X-Gm-Message-State: AOJu0Yw/RmDwL3wYia630dPHuPK1TPUtEIov6ngCO4u4hjwescmTfAEZ
	QkdB/hYLudjTezlJjEMpconO0cNXS0dR3sIjLZzP5/d1LYEgNhj7R6AwKawzVLA=
X-Google-Smtp-Source: AGHT+IGperAsreQwk8XnRev3gOt4q7GzktMMONxmuUmn1kwS+TeNOFT2WVeQTw74xTeeAtlxjJAZJw==
X-Received: by 2002:a05:6512:285:b0:52e:9b74:120 with SMTP id 2adb3069b0e04-52e9b7403f4mr111118e87.19.1720003403696;
        Wed, 03 Jul 2024 03:43:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab2ebacsm2124167e87.210.2024.07.03.03.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:43:22 -0700 (PDT)
Date: Wed, 3 Jul 2024 13:43:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm6350: Add missing
 qcom,non-secure-domain property
Message-ID: <wlqlcrlh4ogzxkbwmte75hvfatiysodt3ohlxxsyzhxkzyukh7@epjxupcod4z3>
References: <20240703-sm6350-fastrpc-fix-v1-1-9f127de17175@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703-sm6350-fastrpc-fix-v1-1-9f127de17175@fairphone.com>

On Wed, Jul 03, 2024 at 09:03:01AM GMT, Luca Weiss wrote:
> By default the DSP domains are non secure, add the missing

nit: secure

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> qcom,non-secure-domain property to mark them as non-secure.
> 
> Fixes: efc33c969f23 ("arm64: dts: qcom: sm6350: Add ADSP nodes")
> Fixes: 8eb5287e8a42 ("arm64: dts: qcom: sm6350: Add CDSP nodes")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

-- 
With best wishes
Dmitry
