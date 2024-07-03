Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53E717B518
	for <phone-devel@vger.kernel.org>; Wed,  3 Jul 2024 10:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720003344; cv=none; b=ZXq52B+Im5HHzPQjQDqYcJ2eOfsOB6JxkmEXond0HnED5Mr4/QreUdY/yuHd/cTh+JcNzR6QYDjmT+0vqm6kpt/6t1qDebawnZ/TybTIMlFHe8+it1HeWw9uqxOAnn/OU9ofHwCWAKwuxVK+Obw/m8R/RU2zY1g/7dAPHa69YEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720003344; c=relaxed/simple;
	bh=+qeav1XYsLy6VqdTKX2WYfgYp1f8/s8aYqZZTA7+cn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzdEHKheZjObDrjPibGIn2nXJbJpxzE4CBuxcu/ZJ91jmA1NYYWn1I1dpwhhSKEO+1pWUXnSdgs7KOYRIjfbXItCeJ7KmzwDsiZ+lgjV6bMtw4QW3m//i2SWzgrt05sCsWD0bSOnuvVeNTtALUxG6MjOMlLS6Hg+0kW1ObYjQh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d5eobs/7; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d5eobs/7"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52ccc40e72eso4426728e87.3
        for <phone-devel@vger.kernel.org>; Wed, 03 Jul 2024 03:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720003341; x=1720608141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u+8jSn1E/yhCSIPYZqegveZ9nuMdvW8tlwjJzbxZ4/s=;
        b=d5eobs/7f8CXThQnfnvM7v2EaEIvWO9yhMfrCjj9Ag1dOGGUbJtP+PQzKKIQcJa37o
         A0niD0G5WwABeQoyvqKH9KYs5RsvDWkmHtIEuRWuZTJNZh3FoclSyHEGE30BkYNG4oaa
         7R8LnBpboTDx9NpqdT00HDyIschPfn38rhWNov9au7d5WS6k1BebgHiQ1/bcpI6skj20
         DXbFjuH93nP/CXisztWNNGIc6CshSEqmugHz483CO+5OOWnepgzEK46D7iWiQWkIeKz/
         rqBsk36lu8ZOjKmlp8EEJWV1hIfR79EY7HuxRF7v+W6FgEL9Tn+cr7+SqVXTOR6e/Zw3
         YULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720003341; x=1720608141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+8jSn1E/yhCSIPYZqegveZ9nuMdvW8tlwjJzbxZ4/s=;
        b=QpRD3y1iB6pE5nodXsIfDSNqeB6+TePwwqxihUY9l0Rec2JlDVXy3l4/moa6e23TTq
         3HxxmEyrtKM1xBDPs2JwzZz6hvhc9t9eh4A6cqUHJT+gYzoYFjsK7kZTE3WBG1pMS7az
         LbA+f0RQ6/T7/OTpeXLW5srqaAdPJJ4xxUvoYmQq1rBkMGxJgPcr0ZHpSDWTxZnxL15i
         Xc1y7SwVQAVeADC3GzeMBD5KkxQD0ouFmsjKafc0wCeI5sYwcdDVDlITgsu8zbEsumT/
         c31DIlG1oYoyTRL6Ixm0ySNlOFbFWGaNirIt1cPmSvhoi/VbbAAvD5XB0Xe+X0r3pfTr
         ddZg==
X-Forwarded-Encrypted: i=1; AJvYcCWrspt4VWD9trhtqIgZO8VXrAquJSw6IahAGNDZXhOuyeSFY7tXNQEomZa6F/ZCNIAT2hiRe24JufW08McH9a2hOOqBze07mWjjntg=
X-Gm-Message-State: AOJu0YyLG5fX9M6uVos75vu3DASkIDU6Q1b1G1yW6VaLDkI2UUaDYG1U
	lnpdJbCk1fDd6jfqUC9hf9OWQv9jfcv2eTnBHToXre0wjMAgWA1YZMj6zv4i4Dk=
X-Google-Smtp-Source: AGHT+IH6JJtUSo7ojZ35ce20s/r55s3BW08cZO2StT7odZK8FedamUA06n8XsyRQp8517JigUqPkhw==
X-Received: by 2002:a05:6512:1089:b0:52b:9c8a:734f with SMTP id 2adb3069b0e04-52e8270ade1mr9509495e87.50.1720003338920;
        Wed, 03 Jul 2024 03:42:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab0bae1sm2081496e87.44.2024.07.03.03.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:42:18 -0700 (PDT)
Date: Wed, 3 Jul 2024 13:42:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: Add PM6350 PMIC
Message-ID: <fcqzyi5vtox7fvs2nu67nm6y7bcjoabzosfvbqkj6n4yxaebpw@rneg5o5drkc2>
References: <20240703-socinfo-pm6350-v1-1-e12369af3ed6@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703-socinfo-pm6350-v1-1-e12369af3ed6@fairphone.com>

On Wed, Jul 03, 2024 at 09:01:03AM GMT, Luca Weiss wrote:
> Add the ID for the PM6350 PMIC found on e.g. SM7225 Fairphone 4.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
