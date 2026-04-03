Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379FA2F361E
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 21:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775252879; cv=none; b=VibusoIpOzfNG8H3Ll2W1+quBrUncAhS1CE8NPvSoRVzIXt3Xke1w3QKVAC1snMuSKuQ6jpk6604GJQeGMG23WTKkGVXlZi2MaSG9IHPybUGJBxx2oSlrD+kiQdlc/LhbSF6+LlH8YAAPEAPASUc9DBEymOkzDLKzBvyqxpNlR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775252879; c=relaxed/simple;
	bh=obSRFqphICqgwu5mGB5dOzzmoDIay7Ygz+pA+RIw0tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7nhMxYXEHqlYyyxnLCyhHEaAaoNNOwrm3bihTCejqXQSGGqOb5lCPp62K+ln9bedZQ02nqC90kwMT0QIFgHuZ16MS3KTFXAVfcUzLmjhn8w0rvuywBT5ymPbmllYI2keDX7IOC22084K8n1pnB5PBBygE08ZD8BYxjTtf2OVDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNkJiBdU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EYcI7FYR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNkJiBdU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EYcI7FYR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633G2dbx2707236
	for <phone-devel@vger.kernel.org>; Fri, 3 Apr 2026 21:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EmZwj5MaWSd913J5s1DiIbj1
	ZJYGAjg3Ytgz19+VIvo=; b=NNkJiBdUr9k04CqPptP+mgzxkXXxEYBFuZS2c751
	dZ3gHcMzXVdD5udjq/jQbvVgNtwBpDUiUaFZt/zvIdGerjdIz64aoK0GJS5NprEd
	+Q8TJXY4ZWrpIrOIFgDtGMOecVP/0pEdo/oSbpT0FouqdWZp8nGQa/E7Xoipapw3
	MRMeLbbiFr/SnQVbJcPE0NaQmZnHh0SZGKQAJssRtMPBxp7J6sBSElGXMaDSFCgL
	GfGPcJ+KZIzvX1hs2rrAIQwCyb5z490yo6W0H+4bQ4Kim4lQp7TowmPAwd95BRSl
	aIsPDO8kxE9djO49WzfmbgG0mWuVkx0JUz1sIfg3BnbqoQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9yfjku4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 21:47:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b34223670so107218611cf.0
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 14:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775252877; x=1775857677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EmZwj5MaWSd913J5s1DiIbj1ZJYGAjg3Ytgz19+VIvo=;
        b=EYcI7FYRVnJJMY74rEZB14rWAg3gip3DhiJb6U/BJV1a8s7lvAHdtrQYGfMc7WpeS8
         qVpOkn8xsG4Q+QpRbm9bYOIB1gWayJJenclAZ78cqmzgH6lCWCiaoqOZ7Wfi1Co2yxoA
         hlfOttKM44kwIM8T0H14hOqPwrWT09+WDdNLNBKdx+QE6w5NUDBAfYLkUAo7a1O3cDHh
         dYUh/syEpiRKnjduh4QLoKmzsTyvNFymdFXQ28YU0x50kgfGQ7b3qzmNiXMXcPuAuA4D
         a7EX2dkg8gg3Us+T+2lQuyJFwzff894zTuhPNNfkUX+nZcOmLN4iEAGIG0iyDa2uiQFd
         lkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775252877; x=1775857677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmZwj5MaWSd913J5s1DiIbj1ZJYGAjg3Ytgz19+VIvo=;
        b=E7lHgIPQbgVkySSZcJpkEB5GuH/k7OTCkpYqRkUCpJwPInLg25HS2clWk4FTnmmMeJ
         a6JspjWzOI6eeIRDVYZ8M8eZfKQCdqKjDk85hYiD0FG3ZrHy6TtYnqKIhQjobva/v+bG
         njz5INNIwcb/qs616RrIY7IN+RFT2KwC8q6V6jffU50dn9auTnz+KljxkC6WdDc0JBFb
         pIJXP9aRQLJziyir5UugA2Gh6FmSaExgx6N8iJEJp+Lw7s8556HvPSBqUl/HtcK4JgKI
         4EMa4kFuKw+95KzgqgEKlMoRvkd+bueX0HmArbbCxiECl0flYIXb/EZfGITWGa+rY4iP
         Ft4w==
X-Forwarded-Encrypted: i=1; AJvYcCVrnO4978qQrh0J1T0579WFAUKZHG4OhNNHPQKTun5HZ7VyPnS8LrZtb6JiQFSzVJxL93XfI/q/MXwC2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWsYW1+lBTrir1JjuerqLkhEKVZfk3v0gu/YXaELPBL/LvRcd7
	uhCKXTzGeEtxw2IWGz3Wz9IUYw8zFQGAJVICxw6VLelIRR6OmJyDPNJxUHefsXy+CK3lElOfF02
	E7UmZ3D0B/ha/Fm/ulR87d4yv99YOp6RoGnIF+xAPA/X35kfJGtFqBV1T3VTBDcCbdA==
X-Gm-Gg: ATEYQzytDd2hxLSOjMMUHfjuIRoAGlta49T8cJNiEGpDvq68Lubp43xXvN68fXmgdad
	OZYC9X7O/b23R9x1MmIAptenxtOeGj86MQKgo8/Xl4/rHiY02tYgyb8fYw98xwSaSNAKpd2XD/w
	tNWHgqICQYtmOY05ZEDi/NI8L6zEChOmCIDvSgEevBn+7QW8uRBJXwmiYNHPURT8vOHhin+i7rQ
	byebM8vUtEKTsmYohm/21tLNEy33r5Ib+HeDEKgmYb5CCX6IDLShcUCamHkK4qp86awlw6jDdYo
	9b9BXS8WECPG3qBegmP3oyvgvwcVTqeAPd+vktKfsc+yBGSib6GUTYq8XmbuYQtH/XCvS5ZsQtG
	wz77JMBCMS8RS7jvdPh7oRBvxOamhYfhkLqWEivWTNvyXr3+kzkQqMTT4oInAiPxsvjVtgXNNbG
	MvWimKDLD8qixIBozKmIhIYBFNteWIcu63+tQ=
X-Received: by 2002:a05:622a:11c4:b0:50b:1adf:89ba with SMTP id d75a77b69052e-50d62a7f2bamr66782761cf.40.1775252876692;
        Fri, 03 Apr 2026 14:47:56 -0700 (PDT)
X-Received: by 2002:a05:622a:11c4:b0:50b:1adf:89ba with SMTP id d75a77b69052e-50d62a7f2bamr66782381cf.40.1775252876146;
        Fri, 03 Apr 2026 14:47:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd2187070sm14998261fa.42.2026.04.03.14.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:47:55 -0700 (PDT)
Date: Sat, 4 Apr 2026 00:47:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: qcom: pm8921: add labels for ADC
 channels
Message-ID: <43agfdcud77ifh5oxkrzkxb5dcybja6bw5f4bxd3ebdjjrni4v@xc7rhornw4fh>
References: <20260403-pm8xxx-xoadc-label-v2-0-29b50bf821e6@smankusors.com>
 <20260403-pm8xxx-xoadc-label-v2-1-29b50bf821e6@smankusors.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-pm8xxx-xoadc-label-v2-1-29b50bf821e6@smankusors.com>
X-Proofpoint-GUID: yFObIpJSiDI3kJuWMaKeXxRrAB6Dtlk9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE5NSBTYWx0ZWRfX6mq0X08vKW66
 EbOJNiAqyqWXYKxw3NOIZVWaJVFsdvdP3p9uczQmsjSXdFnT3jislT80tTgQu0YGC9xt7N4JoHd
 fadBHoQIV82PgkW+XrYKy82snj3P9yMr9VkmQ5JC+GPDSOx5F1IyrftVWjVbgj12hdlLioHD6+W
 7NyYVGynC/GsOyoumuXChQ8BUD+5g8wXUxjL5xCD1WPWh1ABoM+w/bLjFTNN07SmNEr6gfLluHi
 dcYIXJDlxdi3yduee5O/4Bm//eNk28mn12EpUwIcer/1rABkoEHp2v4XTN0XnRKwW5IQC58Dt/6
 YZFt0Y6H6tblERfEYyTfE1yBeCnkxNltb/OjreYroEFApDn7y9QQdGShqHLAV2VyGMkHZSl3jx7
 q+ATwRufB5akiaH10yr2CGXYm/yg52nKwuaVRBE0t7TEpmC7DuDP0pVpGmCnLvAo8R2Db2d4l+I
 I2fJVUZavzn5u+jzbmw==
X-Authority-Analysis: v=2.4 cv=OrpCCi/t c=1 sm=1 tr=0 ts=69d0358d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=wxLWbCv9AAAA:8 a=Ke7W15zrM9QGlUBYRRsA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: yFObIpJSiDI3kJuWMaKeXxRrAB6Dtlk9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030195

On Fri, Apr 03, 2026 at 09:23:14AM +0000, Antony Kurniawan Soemardi wrote:
> Add label properties to all XOADC ADC channel nodes in the PM8921 PMIC
> device tree. This allows userspace and drivers to identify channels by
> name rather than relying on datasheet name.
> 
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/pm8921.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
