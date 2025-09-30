Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9B822E3E9
	for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 19:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759260687; cv=none; b=qnnZliwbkGqe/jmuB/6b6C9EF0MHZGRo3Ge/3/EGM3IM/tw46ow50a6p4rgXUCEK/rl/UeqVC+oUhhQPdhvAWgpCdpXxfc2t9j3xUQhpnVAJSe95625EZ3SXfbODMfhSNWHSXqzu4TAFKx+Xbec4tTo0MdhJ4dsO75Rcr22g9zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759260687; c=relaxed/simple;
	bh=Of2f6L5h6WLUp8mGYfj0H03Yo80nbEPmPnhT5Za7vqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cfx4eQjsS5ay/N2g8RVc915tLyPaF/g5t2q4qMnz5jQkzDz3DrUuqV8D30ohwSLJ1tixuSku9VcHVoWkzbHaxrjGKNH1m2U8AzoWH03kN8RlnWaGdS1/sIZxJ3g0+SzUxeTyH8r+xfSeAHmvPYNgsyK3E5WK/YsQ/S5+D7rmcKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RN0XUcgX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RN0XUcgX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBbuKI027381
	for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 19:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qEQhoU+0iFnQpnaZftTjoGCy
	Q7E27cWAqjV3I5TP7xw=; b=RN0XUcgXN5DcNpcwcO/eS2stoY6MTrUel/qRdfZO
	19aOsf6vOcQArlbXjcB3myybZzC2gB6TOufWrCODn6gtjsxwDEMpbVHBZP28AMEu
	2aJ+JA5jMGiK4vD7dwLBf+Dte0a4uM0N3V2Bw1f5S5NrgV5ExAAzLkXec86i32Q/
	DpZT2XNHkQ2gdMkOwOnPTOSWTrhVf8mSqE0AYs+x3W/8yMGQWeHoRLv2xEmT3Cte
	EjIZADAB4xRQTZa+cP0nu1/zcMW5iWi92XM6pnBxBwejf9uH6Q33grqei7aMBOhE
	R1xjzpbElrSwMAOOjNEnx2fnsRl84gFbHuM+N6XEU/rG2Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851j6s7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 19:31:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4db75c7fa8dso149089641cf.0
        for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 12:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759260683; x=1759865483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEQhoU+0iFnQpnaZftTjoGCyQ7E27cWAqjV3I5TP7xw=;
        b=TICe/04/KD3ZS9qzylUuB3mf3bLVd97XGjR6hemOtwiot9ncooMD6RZOum4Eg9FSVe
         nT4c26NSkkumUyH9+3EGHOauaKT9YtpWnGRX54xpYoL9kbVLDqS1LBXlaTfdVEhmsYEi
         RS+TLDm7meaAqG/RXAqxQ4qkQQ2jackpZQQz3r8zFRWCMlIn5yeaReAp1Mpe89NSkmQF
         S5ZIetyafSMKQn2zVlUnIvW3OsLhusqhaa62sJfLSl9l6nJyuyPn2LJlZUtN+Ot/8zM1
         +B+3sAt4EsCy9yRC8AH12x7CJZVv4Y0sQ6ownUW5yaN4yA1NEzVJEWzCaUWjUCdarg+J
         uOpw==
X-Forwarded-Encrypted: i=1; AJvYcCXRQx2DUGV6pj5kmgzeG3QcTYjaLtLxzRqn3aneoWO60eeXCkVFLIgcWrmRALIQbvpoE04gj03pEpiGcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuXliCfJrzRk0r4PPHTBFD+7XR3YJo0HVTewk7KjKFh3FV/NOs
	1+PR/WAqW3eAGAkcAfQ4/Ij581OIiADf+pFSX+HhMWEZyS5WQrKpe7zRQiOkWHQa540Fsp4YMzk
	eURH2q49INEWv/mFpGcFhnUnOr+INnVn5r3h5DQEkdfahLrrohentRzH/CvnLNh/I7g==
X-Gm-Gg: ASbGncs68TGohmmHDRX7nKZexWvXWIEGH0NujjFXr49G1IPGVzyyAKkA47eNftzTFTS
	o2Y7GKHfoC2yvW9zhQ3Kmwe1HKZd8Gcjkw8zDsGCmEbCmdc/C4qocGG+LV8d8TXthMYRwcM5gCW
	uJ3q5S/IHzpFY6tC9I4SQkhWdx+qKRYAusQ4cyJM5Iaqm5B2d84Yyo0xbJajr9uBkSyC2puVeXR
	qw97m/jo+fGSXwJ96E5PHyEseOLb5dw8XsIRUnes29j3VGki3NJkPTP3St5NpaJgrjxfzAwU5ik
	afNK9QFWXqvn8I3Qxsra1mFxIOynac/FhgM/ocqGzL/VI/vW7OEac2N4ak55RQaPK44MbtyRvt5
	6dJiXRne8gm0rGQLHPMhKJiALz6C6G30XjrrcVPBg1FyDiknvvQsZijrbDQ==
X-Received: by 2002:a05:622a:4c0a:b0:4d8:372b:e16a with SMTP id d75a77b69052e-4e41c923fb1mr10954401cf.4.1759260682663;
        Tue, 30 Sep 2025 12:31:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjjibGLb7dPD+kELAazeCZoqy4mtJTjmHTtorOnQOzn6lZE7AZh1Ew5Qdes84qqX8F3hfRXw==
X-Received: by 2002:a05:622a:4c0a:b0:4d8:372b:e16a with SMTP id d75a77b69052e-4e41c923fb1mr10954031cf.4.1759260682236;
        Tue, 30 Sep 2025 12:31:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-587748b15d2sm2159965e87.7.2025.09.30.12.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:31:21 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:31:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] arm64: dts: qcom: sm8250: Add MDSS_CORE reset to mdss
Message-ID: <gabbhygjn5nky5prr3k7ozuiwhzicp3yuvn6qqglqyijt4lbvw@46pdixx3nprn>
References: <20250930-sm8250-mdss-reset-v1-1-a64522d91f12@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-sm8250-mdss-reset-v1-1-a64522d91f12@fairphone.com>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dc300c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=oWIomgx7Mzb9_gp1DSMA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX3Zz8+B7Qxj8w
 3pk7StFktJ7tUR6nUcj8pGj18nRif57a9xf98MrLC8X/ako5KmhHRapbnrYlCOU4Zgr9sOcBxoz
 mK3EO7D7JkgFLjFs+cR6aiwRNnq5dvXTODVDXHyYMEucexvAb6sLDmoQZHxBmZrXtqlQ5/miAQT
 n+HAtfGRLWuRq6SgcASkPRoW/FemxMY63A7VqSVSRTGRpDYUm20l2atW9MsZN0rnlKragS0eIWa
 73XdFyln+ScKchkUsDG+g6ITwR8DpveSss31jG7w8KcCaHctAA2UxNe4xeV4xMkp8sck72zNoQ8
 rdGuQNExnNMC3s7ySBF0h7CI5n5IFud0Lq5TuIHOjrVZRKmCAXuXV2E7XohUAJOvQ3Zc4Jg5gUm
 vq+lrE3N+i7A6u8y+9Gh3zmDishIHw==
X-Proofpoint-ORIG-GUID: azGbjevhdNTccuNOL6PxHft_zGuM9CeK
X-Proofpoint-GUID: azGbjevhdNTccuNOL6PxHft_zGuM9CeK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

On Tue, Sep 30, 2025 at 09:37:22AM +0200, Luca Weiss wrote:
> Like on other platforms, if the OS does not support recovering the state
> left by the bootloader it needs access to MDSS_CORE, so that it can
> clear the MDSS configuration. Add a reference to the relevant reset.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Not tested on a device, but should be necessary on v6.17 kernel.
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # RB5


-- 
With best wishes
Dmitry
