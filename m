Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE5D257852
	for <phone-devel@vger.kernel.org>; Fri, 19 Sep 2025 17:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758302673; cv=none; b=uEa18vZDpJurMeBfquP2QPA5enxjNLHC67xEKsYOJx1Z4nILp74erKppJHNIRYiEy/LQ4IxQfIkJuION2Gb+KtHSHobX+Ahuo4a8w3q1yeEoNDXyucqGWh8MGpK2FBPDvvxIs/PP/ra9p/YIzaAMugPbQfaRNFDj2k+vNTz9G0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758302673; c=relaxed/simple;
	bh=jz6EK/5R/cZ51gSyiWj0rppUrk/++V0bISlTdb7FPBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWMlRR6I7kdbxK2jQ/9EbiahYInYHEE1+U4YDhcxSewc+ndOPzUH3YYIDpsfttDWP29EsQJUnQpodtzic5W67cSU6wUSKXJMSCwLGPBHg99xb+1qaCJfRTylcILoVI4G2A7Y+gpjUx6Pkn1g7xffht5jkkqyi3QsOZmqmXFdAdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Akjzzx2E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Akjzzx2E"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JEZqNf017946
	for <phone-devel@vger.kernel.org>; Fri, 19 Sep 2025 17:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2SmCmfA+ffYL/cc7ScaFG2SQ
	47LI5h70ggIXvRCOHEw=; b=Akjzzx2EPN6moRmflxOtitL+pQPgsWDdtWBjIDzb
	SI9gvZn4SDbKuRbRCI/W8Namjisn8Gj47i+y1yqNnNW0fWGAeWiU584myZTd5prs
	sBFkfPgTJ5061jNFFGvJTdogvEPSvgarLFocP9gB5AgIoGdMbaeu8bZr31+UCY4L
	WTp7+VdRKzvaRfr9DHQS+PAe7MyrPo1TzIWT0qVgC6JYFJ+Q1CRgNonqOWyGk2Qs
	+gxPs/0sFDZGU2olQdb1AT/yv0CqMqMB5NgveyKypKLRs13HlFsQsHeF0zUPgdJP
	7+THt5oGeOj0QyVna4exc21dD9bEF2V1AW0CPntGWCmHdw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4982defu4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 19 Sep 2025 17:24:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b3415ddb6aso74882921cf.0
        for <phone-devel@vger.kernel.org>; Fri, 19 Sep 2025 10:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758302670; x=1758907470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SmCmfA+ffYL/cc7ScaFG2SQ47LI5h70ggIXvRCOHEw=;
        b=CYC+1TLCnTTaH3AWlV1jJqsL/4VPh5Oi0w4iSG4Q6i+I3Zou3k1F74R27PdGPxXeg/
         HD7+H80Fo5lvG8XYzaST06dE/Tp3KHA5bldYnRAL6FF3Y4+Ke7qK9BYLrH0FoNQNqKaA
         VQvOlLiWkVDUGYtO+P0NsPBWhpX9cGABzAfP5gVHAyQM2eixpdenU3nt+Faxd2MXnGKD
         3OwvmUReMXp4yDxIqd0X13RRKNOMLGvN+lTKU6AqUiE4Pbdmm9EjnKj/o4WUCehtwXaN
         z0nIjhr4HzJQPux7585lAvv2DucmBxSGcpXRH9mbco1TvlX8d58MVLwgDRJrf7i5Ij+K
         DDww==
X-Forwarded-Encrypted: i=1; AJvYcCUwkX1TPNjsM5HDWCISbWx3gl2IiSa0N707KUznodKqi7jEWVPg+ZG67tJrCMeFq+XPq+b+/nuNQoSxaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZGkKTteB5qKrGfbu1xqK5WtgL+7ALkXHkLBbASHJj8jgHs/6X
	U5hwPa3jpi/kT2Fj2yZbtbp7MGdzMi15IJ5uaLT4Zf5/WhbE2M/OoBJSA/pt+vTQ4a+A3ACJTXK
	vimlMm4QGA3vQaqF9B/imvT5WrbZlL5yOOTuskQUvk5z/cssBkFmn1KuAa3hdc+HPKsCdlTA7pg
	==
X-Gm-Gg: ASbGncsJ1s3CfWy7V2OGkx3YcpQZfDUIEXLGTCvdp0uDd80FpuXe8eFxttAbM9Qzh8z
	Ibw/LlzidAJqk6YYLm4h/6hpuYTjEH2UCJktXFR9jWSn5fe1tkC3EvkgE1VPkpS2sUKCbNyMxg7
	07fo1sBLbaa8XLg+U1YSaQYeThqRMzC7uFsY06Nvv5EQ9Aoj6rS008dFckPwpU4GWdAd0l3+nQE
	YLHv4ycIJnjAwSonpa2g62Utaxo0GSYlU8iaSnubNfD/VV24Z2xPOao4Tzpq9hHyLgSeu6OFAS7
	d5iIoiuPpicwkUzElLXOLK8tpsN+DdRKUQCF6F1YyvYB/L0OxFHNztP41pDayMW1hElggAmrgDQ
	JFaMgv6HpQYMhHMQZr+XvSAuSWALPpEHXnLTZN1F5gmJa3Taz5w1W
X-Received: by 2002:a05:622a:110f:b0:4b4:906b:d05d with SMTP id d75a77b69052e-4bdae5ac1b5mr88562211cf.29.1758302669461;
        Fri, 19 Sep 2025 10:24:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEowL0VkIS55e+wrnpXk8ejFGWmiVu1K7CSpGZAvwocAzm3e82EVFvLe2rVUzxckJSDcYN9iQ==
X-Received: by 2002:a05:622a:110f:b0:4b4:906b:d05d with SMTP id d75a77b69052e-4bdae5ac1b5mr88561851cf.29.1758302668930;
        Fri, 19 Sep 2025 10:24:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a8fada4fsm1524487e87.89.2025.09.19.10.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 10:24:28 -0700 (PDT)
Date: Fri, 19 Sep 2025 20:24:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: dispcc-sm6350: Add MDSS_CORE & MDSS_RSCC
 resets
Message-ID: <cujc27qvhzblxsvkiyn2kpyl2btkeysr22amuhpfhjlsvwfuka@ukzba7jz4ftp>
References: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
 <20250919-sm6350-mdss-reset-v1-2-48dcac917c73@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-sm6350-mdss-reset-v1-2-48dcac917c73@fairphone.com>
X-Authority-Analysis: v=2.4 cv=YfO95xRf c=1 sm=1 tr=0 ts=68cd91cf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=S60hzewbzrEDFSkdeIwA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: GDTeTAUMlTC58MrzyGAHFro-3UxkUjqO
X-Proofpoint-ORIG-GUID: GDTeTAUMlTC58MrzyGAHFro-3UxkUjqO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDE4MiBTYWx0ZWRfX+OkUEzPF7otW
 ubG7wKi7XxosQTwNxZK/ON13w01+EtckzNeV8xm75Z8ZhsOQKQn0h2hqCQ3nPXzi3d8zGLun0Cb
 bP7rpHIsFpLVurQ4hA2o7JezHLu14YAkZM48xRsgne/mGcoXnVNmP3M1qyNliis6OF+rmsV1LSR
 jJDS0020QrGt/HMIEcu8AnN4nNPDPhtO4tneKj2SMn2XUyLtnS29AH0Ea1SoV5E3kuUPL/whdD+
 A+TkR4re9SZ7O1/+kuPVLFZdIxRYUpEbKTqj/bMpzYjTiCfTvMAhIZS+IgafifEO+LJUpeJ95iJ
 0HEVrxVUYUln9/z1WaSsguZaCEb7IkMjvCoJ9Mye0eM66cv3UoJLQd/fbqX/gSIoeyMdbyurPTt
 dfb/ziud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170182

On Fri, Sep 19, 2025 at 11:57:24AM +0200, Luca Weiss wrote:
> Add the offsets for two resets inside the dispcc on SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/dispcc-sm6350.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
> index b0bd163a449ccd2b27751e32eb17a982facf07d8..5b1d8f86515f251d90e01a4f3cb3b5582b5db683 100644
> --- a/drivers/clk/qcom/dispcc-sm6350.c
> +++ b/drivers/clk/qcom/dispcc-sm6350.c
> @@ -679,6 +679,11 @@ static struct clk_branch disp_cc_xo_clk = {
>  	},
>  };
>  

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
