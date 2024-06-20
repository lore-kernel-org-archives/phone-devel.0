Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9276478C8E
	for <phone-devel@vger.kernel.org>; Thu, 20 Jun 2024 20:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718916122; cv=none; b=o39rDAWuVKdZbxDqgSdT8CCfn2pAzRBMAFxpQbJ+fMxEWzS8FOsHQZIzV/tL9/k+YdkZRBC4/dijtsGsV1pq5GMseswbKMTFrAa5vWVeampx4SxpFiM8klcTCNXcXBBNR6MChLM+TNjFj3/2CkDBIIg8XfJMexeVJQ1o0Hb12nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718916122; c=relaxed/simple;
	bh=STh/90eMk3NBXI2lNFEtFDudfXdIZLwimllATDz1Snw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LT7CZezjUavtB1Nz6FMCnrNgWIFaRuwKgmao8LJSJyOo5Q1khXdjdj5qC0iabRs+b1SOz0sMW9RQb+4eaLmoBXifTR0U7XY7hskHSuYwYMf3O90gOdDyxEU3D1QVjJbfnkNSNm3VY7y9bW7f9pUh15qIOseOGtwzLyubYXrQXNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pGOqHizD; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pGOqHizD"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52bc3130ae6so1306840e87.3
        for <phone-devel@vger.kernel.org>; Thu, 20 Jun 2024 13:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718916119; x=1719520919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0UDba+xJOloimcJU8oqa5SsgqIPBhxJOEST2VwSWACs=;
        b=pGOqHizD+8IyF2CDvSZvWam4F+yi77z0oG6UJVMRE2LBzFevcAwCYKytnWZNjPa+kX
         4ZVXKHDRBzDITl7P+oVDZRAhq1BgTSrNZzHwLp0+sDeqKfSLqIFgMgKVf6Fl6huL8jN4
         3CP0NWaa7QpsZl526MtdA6svs0v189ms3SqdXBK6NbGAwwvnYkuN37b7UkC8gvKyYPz/
         CdS41E9cAMeFrJDnqBxthVHvYeg8ktDTfCvxIMNwAVlqQPBBaqfb2usoaiWZ3pcsq+fK
         9haD7di8+6O2JcHUTKLEBs0VAKve3QSn8nyUdB/JCRhceMIZ49itWiAzyNu1CrNLudo2
         Jv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718916119; x=1719520919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UDba+xJOloimcJU8oqa5SsgqIPBhxJOEST2VwSWACs=;
        b=fQWYPqtlbfjQ32FUcZx8oidHuHPbfbV2wSs4oAzHSpDFA2yhjR8+9so05orzxec4tF
         sx5LFw+oF2/Vw6TKlRSgD4kY5CFLhMngzie7ZqTFSqM5lP5OMSb3HDOfIH9Usrl4ktOV
         13W56VNqxp4Xlmc/PBqipgsDkNMuipVTu15bxARhKu+I+mYp2bC21YkAdNeGLIfWM3vy
         U/8eiV7rBpf4k6y4qp9690eUrabhD4yKRyr71h9qxJT2z9THhIpHEMcbeD8dV6oD9T6j
         bCxYsTcExMHip0YD55lYevq3M1kq4b1tOMZVEsWua2wa8Vrwjnkz440T9A6C23a15CEP
         9MyA==
X-Forwarded-Encrypted: i=1; AJvYcCXTf85lQ4BLxixJojCU+es6AnEREOPWHtOt3GWGWTDJwA3yBKCC016iNdTh9u2s3sEUc19ZqDemGOEpXxQBK4hyhr/Jrq3tw/w0kAw=
X-Gm-Message-State: AOJu0Yxh/NvYyFdZeOM4OmsbxAb+0tOodFc7PZ2yYvjshIaX/adR51JK
	cX8KR2Qkad2yheOfIKwpynvSbwjaP5RWCCVce7r+1FzRZ624Ptc5UAhQMZ+osyg=
X-Google-Smtp-Source: AGHT+IFvDEBziAChv29W9y+hlbHpRWjQtdeBZlkVSappPVb9YfmbDmaebeCTAlFW7AujfRDaP7GPgQ==
X-Received: by 2002:a05:6512:3b23:b0:52c:ce28:82d2 with SMTP id 2adb3069b0e04-52cce28854fmr3654990e87.23.1718916118870;
        Thu, 20 Jun 2024 13:41:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca779db82sm1912644e87.176.2024.06.20.13.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 13:41:58 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:41:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: msm8953: Use mboxes in smsm node
Message-ID: <tx5hi7sb5t2lrn5g2atp3pugusaumifnqateu44h42funftybq@nnfsim7c4xkp>
References: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
 <20240619-smsm-mbox-dts-v1-4-268ab7eef779@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-smsm-mbox-dts-v1-4-268ab7eef779@lucaweiss.eu>

On Wed, Jun 19, 2024 at 06:42:30PM GMT, Luca Weiss wrote:
> With the smsm bindings and driver finally supporting mboxes, switch to
> that and stop using apcs as syscon.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
