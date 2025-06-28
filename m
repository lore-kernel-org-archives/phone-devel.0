Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877591E7C2D
	for <phone-devel@vger.kernel.org>; Sat, 28 Jun 2025 15:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751124636; cv=none; b=AczHUeiNZXGtGg6lyTogT2yoecTfQCDrfBX+bSMXbIzGTmXH/oro2TWe4etd1dYxvI8EsiDT3eB9u3gI4TMNEp5SngkPaw7795L/MohtF/LDdAsREJPS7C9ObF0CKjbBMxsP7W43BraR571Qlizjwu2/NcDN89++VcJ9bapuKj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751124636; c=relaxed/simple;
	bh=mKixHPHsl2x8zrPqtK9Kqr23QXdhN1xhXria8CsRP/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BstAVvc/enNzJfHqmnZJMCiSVdDsUS6Jlx8eaIylMz2htL/Jo5fLssYs7g1s+1+E53b5uI21x2FpwLlFhubF1Y+pU9sV6LmTRPzfdzBYrK1ek0VchsC0IU3Bd7WezXsWWCZ1YGr79wrY9cbI2eeQzxQv+219dGAwe5sgYNuIFDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LS7+TBNp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LS7+TBNp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SBVCWm019635
	for <phone-devel@vger.kernel.org>; Sat, 28 Jun 2025 15:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zV6PffrVUkzDxC7z10QqpNda
	qNNap6AdYnPmbW8I2uA=; b=LS7+TBNpO0HgMVDFuOE+T2A0ABY3dsKDAlrCnfrf
	HtLl4g9M4k9asawxH3XX+M7f1l9E0qBrHNefGscfiHCOQ3tWNDTWOMltrR9qzolo
	YiT26QS9NW6ME7nB+ELxDFiR5sGzgojdYZ2Giff9cI9+RNUSJ0w+zOwFtgez0R3Q
	sq4MdL/wUxAn9KfJGPwSEkwCwWYwtQMM+kPpI4dk6bu7b8hdD9uSbuflSDPsUF7D
	zWcNhB1bkYg2byQwh1GwmLnrsX5t2tKC0lMD5w+Gu2gIFeUb8Os3dQAE/Z/0THpE
	xSBc6tz80Vz9cZm08B/ahlmP13F6v8b3XT8Jp6ThJSo+tQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvgw0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 28 Jun 2025 15:30:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d38fe2eff2so495225685a.2
        for <phone-devel@vger.kernel.org>; Sat, 28 Jun 2025 08:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751124633; x=1751729433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zV6PffrVUkzDxC7z10QqpNdaqNNap6AdYnPmbW8I2uA=;
        b=atb7vqCxyfGzbigHctRGjY61ZODKxGzBSjhv7Zq0j0ON9I6fBoF3lmRA/NB4t3C8kn
         m3C3q9UBpsM6USZZ98okaggjIShNabvDQ+kwkPhPdhOQJK2t6hRMktEB/km4cZkMg2YY
         gH+4AGoLsiZjoAPp5hNJvjj4KDK75/rItPXYdQhCvOXZgzQm2ijO76Dw67OyOtgnf4Ta
         9497jqLtI3563l6YieNV57No36dvnc6WFwXfwPu46xxo92al4aCPArKHRRONe2qtBzsW
         Jj319LAQs1JkZn2D+anPcRXPh01OWFMZyf3/4BJzFJHmAihgt7SsL5obKfiCKKOpIFA+
         k3yg==
X-Forwarded-Encrypted: i=1; AJvYcCVmBHjPqJYzMOpYCmW/PG4lu7Es2IJCYXk/xb/xq11q2bKRoTRO1lm2EpaKD4VPwfUBF/BSlIkbqpyUyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNYAOCQmMJr+shstCJbXG3jTK2Xtpd8Z4dzmrXmg5S0cWiWoqV
	xdIV0uzr8Lt5ZoWb2Uv9sIsEQ0xS/a5emgpShCw2+qgeUeJQoxb43oBJFcMwJMSVnk6Wckh36Re
	irfT8YEhrngLHBjkxgiBbqCvOuSV5YRnD2wuWmveLoVlaygj4UvJAjIZzV8UjCy7qDQ==
X-Gm-Gg: ASbGncuh+vlmaQwyCxQhtFAJOzeNIxjqqK3deNSYtGnRPWB+5386kn2uXkXvq+umBkM
	wFdpsvgoMde7JlZoYmDtVWAGYHjlSkdXDEwMzYjp1FUtsm53k4OVo/olV9hENTsZ+r6AGkneQy8
	AenQkzcafb/Y/lj+hQ7TfXcLpE4HlGbLRkdQUNU62xH6idLWZmhsqbUfNaktW2utejYSjfuwlCR
	bpFpUn/NEUbmOGtN1ax9vgbsnkZiwDArkIqsKGKDPZxm1cRj+nlSvrTWF82nPyT+n2DExVFP/Qb
	Zw81hzvTiQUWSjlnrqGNBAj7qnE3SK2cUhnbheOlyCiU2QRtE0YePcdMDa59pmVKZhR48ffzonH
	+FPDq8oR41zSkB7I5af/tyeJZj9xo6WAyl7c=
X-Received: by 2002:a05:620a:2589:b0:7c5:f696:f8e5 with SMTP id af79cd13be357-7d4439344dbmr1111894985a.14.1751124633054;
        Sat, 28 Jun 2025 08:30:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/EwrvsgsuWmlXmk/2zI+c32/xYaYtcpshstsfFwQVESoPxvE4doxrxiYp+KufrnyB1RKLpw==
X-Received: by 2002:a05:620a:2589:b0:7c5:f696:f8e5 with SMTP id af79cd13be357-7d4439344dbmr1111888185a.14.1751124632491;
        Sat, 28 Jun 2025 08:30:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2cd99esm844943e87.158.2025.06.28.08.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 08:30:31 -0700 (PDT)
Date: Sat, 28 Jun 2025 18:30:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/4] pinctrl: qcom: spmi: Add PMIV0104
Message-ID: <zow36rolayslylfozehn7f2gq6bwbkfhhq3sq65xu7qzhpaizf@pvfrmgeshm65>
References: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
 <20250625-sm7635-pmiv0104-v1-3-68d287c4b630@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-pmiv0104-v1-3-68d287c4b630@fairphone.com>
X-Proofpoint-GUID: Tczq8DXSy69lUoXriYO3HHWLFQW0QoW3
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68600a9a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=lH0vaW9HGQP9_1ETXacA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: Tczq8DXSy69lUoXriYO3HHWLFQW0QoW3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDEzMCBTYWx0ZWRfXxvPdWWhCjhAK
 ciGT6HmDPkHRVlYJ04ketQwLFHuboJqON6z0omCojLOhPg4adeEeTTs+D85KAzdzDmcZ9ehObcp
 RKEtRCYaP+Kx07IZ7n3LhpXqAhLMs+gIkUx+hSqwEnUEdsYemojF9EORjIW5K598jf05nAODYk9
 wTA6uT5mCw9D0c6iPk9oarmLDgrHJHY70AwCfUan3lB3amzLP3wyoBxoMQ8PNX+BLYG+s1jATV3
 1K6tbR/n3FjQesADb1am6hnDTc3HOKRTmR025CTCFEetwlmGD16/Gs9rlm5SCNjrTDUSmTcTsbg
 RPvbfgkzR59kck1WEWewz/7GbNhgXCAGDk08cdwGFz5eMbroysfGSyY6jxYh1zh0u020in6IGt4
 4EJyzyd+88NVxFIcN+75ofG41BvM9QI87LHmxrnMIK4tErnDZQmG7mPsJprza7H//09U74UP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=942 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280130

On Wed, Jun 25, 2025 at 11:18:04AM +0200, Luca Weiss wrote:
> PMIV0104 is a PMIC, featuring 10 GPIOs. Describe it.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
