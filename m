Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1778520C487
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 17:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602496; cv=none; b=UE325vX97PjFtwAHNTm1iq7UeN+UffazVWwruBYQsHoNiXaT6Ebq5DgtxJLi+UN7c1DXS3d1L62k2OS2J15ngDacjXWVcmJgSdpf8awuVhN6MqqTTVX6bjee7f9EyCyem/TfQMZf97NFzJvJLEsMS2mXBkHKIpTWZaQ5Km+Bm7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602496; c=relaxed/simple;
	bh=TFEdMlNIoiQqELt0JCQQPUgIJevHQRS2Vk04AlYrV3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXUygdDLEZLy2XFVQMl7El2bX+AXSUklJ5tHj1UqlS7vwxi5BN1WdXs7UcVeBg15yzkH8mhMH6/IKqH9cEM0k4rStqvvMtTmmJJy4CwDlNW8erTTHyNUQ+Ed/dxpwFG4bgHNmmKVmKC/P25dCXFaj1uyDvqfA5fLrKWirZQlhOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHUmUr9p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHUmUr9p"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK0l0011166
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 17:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hLwVTepjDVXejNa1tCFYvYXy
	WyUbn6X2cQd++bAXZOs=; b=LHUmUr9pfAs/bqL9pLDuq57EncJrCRHzEseO84Vv
	a82s0WHx+SIy46WdNQzPmXrvMIPqcdblp12K0z8Pb2bcrMtZ9DqCkfHXuF7aLcFQ
	6AfTX03NYW8uuSMwl8HWjXuVC0tnA/eyNCMkfvceMoyZzghC2Z9kM7a9Jj5rj2Rb
	DR37x2o/XA8f6VWmdk3sDKRcIAr3tvQ5CsV6Md7fWocjhJfezioc06GDCJSyWgbM
	NJ9nuId6HQJ9st/GuJSm2hOfFyzNZShys5xW/UmGrlJFYEUGmd2BNz/9rR1irQYK
	BRI/1aB6NC+XG1Qv5rcj9ChoCo9+tYVnGpoMbcUxbsJOAQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0j06h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 17:34:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f2c9e1f207so41385266d6.1
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 10:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602493; x=1746207293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLwVTepjDVXejNa1tCFYvYXyWyUbn6X2cQd++bAXZOs=;
        b=O1qHUd0Oflgsjk42DpDYQA6DoQ1vshTDiqThx/M4NSKkkzWAFL2GR4EBf6phvFUzuZ
         HWhYaJ3FBrMXcfVDS1TvnXEZhmcqRR/5JYhy0YdhWDXqDAFLVa8d3GwLYZhBrkZa88fl
         Rth7QkDuCqeHRfX1ny9+ntDIXE0pObqy5/FnsapK+P5SRXD3qGHTOkRrH9rc0lqznQMW
         58ZU47HcsH/1Y0tsyYHjRx1M/t/Wubbx9WHf2qosVYNjhWHlPbQYkNJMEP+Y9+48cOCi
         k92K4fyKd8AydeP24hLdKKtn0EuqDZvc4Akh9wX0rb25uwHYccKnHZ+wB9fCjT0t1b+4
         Sdow==
X-Forwarded-Encrypted: i=1; AJvYcCXkjGRm1C0BxJObQrH5rUFeTlAFFbZbFBsMjR9iK25MJgtuwGPj4taj4Z6XqALT/ld6SxZkvZbjxBf0Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt5vQnbROHwIYSJWmTB44aZV4d2yES3YQl+x4mToupI4mz+9oW
	mP+b1yLrlqgA3UMixxUtAN1889vk670CjWopbKZ74RmYAEJEHKqy9iBEK+NTnVccD4zaIiemPfR
	7EuhEj8AqQHRaZu3SUAI54SURky2upChS4Rqsmb6X6Nk5ivahrLKWWDBHVpI9Zw==
X-Gm-Gg: ASbGncuIxuYmipmcXfDgNdTts9szQXZ02i56EiRLIjbjff7hlA3Rj98VGwZ1hX45LT7
	ymD9Z/D893p/WHAOOFsGWNOE9dZ6ZKtnMLLqiy+xvJ4ljC6L8IB9BwT476mqNJYVZiQZKSxUnpS
	TO4+5ImE+9ILdcIPXeRTgJeJ8aecKeOo3lHWlE5WSrcs8sYdWI1LH6VWIwJ+Vus3tbDG/4DeduQ
	Td7ohXJPUtKNGf8AZuzcYza0RCpdFZQAFC4ptwoggzb52oNK+eZB6aenbSvIgsD/wXwHkvOegRj
	4De9DJl+Q6YUtCDP+Hw8B2oMFYukl8gj3SvG0G2VAjv8dmnlTaNI+LFdmRhiyuwRsO4Q109NO3A
	=
X-Received: by 2002:ad4:5c66:0:b0:6e4:2872:45f5 with SMTP id 6a1803df08f44-6f4d1f16818mr4509206d6.25.1745602492724;
        Fri, 25 Apr 2025 10:34:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0SyVjc0RwTNTmuwQe3VVznnrOs1x0zqUz05amuo9krdS8Yw9U8i0uKqP+X/0Qq0cUkmLviQ==
X-Received: by 2002:ad4:5c66:0:b0:6e4:2872:45f5 with SMTP id 6a1803df08f44-6f4d1f16818mr4508916d6.25.1745602492411;
        Fri, 25 Apr 2025 10:34:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d0019d59sm8153871fa.64.2025.04.25.10.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:34:51 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:34:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/11] arm64: dts: qcom: msm8916-modem-qdsp6: Use q6asm
 defines for reg
Message-ID: <kwvouq7elpyzktrwqdzjg7omzzn76ocxtauhlmpwgv6i2ca6wv@gpjksblyphm3>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-2-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-2-28308e2ce7d4@fairphone.com>
X-Proofpoint-GUID: vPMEZoUFipaqP-NWfVrtRM6t3D4a5Rf9
X-Proofpoint-ORIG-GUID: vPMEZoUFipaqP-NWfVrtRM6t3D4a5Rf9
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680bc7be cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNCBTYWx0ZWRfXyBAh0ipsa+Np RVnoym6UB8TMjTfLN2fxrN+fA+D1s/5jr97RJajDpdeohPJYjiHGWvaz1VJZUAaiDkzkGLcyt9V Kis5kCzSumpeEW2LJP/A5oxxpCbzgbRyQ9zPAL/yxzifrb+E09yfkajako/PoEeLx3cE8DE+peK
 bBU1C4i0I2MCo6XgDKtC+VJMtz0bTk84wu/AWgKC0TEBPraXV+R+OTyRzNWVKCxXsiUvQqZAi57 CFUnxwtUfWymA01crPD5+TNi70KGiK+1jdvHK/Xfxp2lHS1yMu0BMp3WP+D5O40is+muLgcpxYx 6GNb52ho9EeXsuDtxf8BdfjKCUa8NZiD/82VJqzTRKkCHKIVwy1+2d5mub+hfeS0Y3EIaPVjjj4
 VACwHf8lKTQitgAj6EHwH0IkwUMdQF7Nl4q6eqe2LoTlIuGBpeQY5sQk4sTXknFdhdJh144B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=732 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250124

On Fri, Apr 25, 2025 at 01:53:41PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8916-modem-qdsp6.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
