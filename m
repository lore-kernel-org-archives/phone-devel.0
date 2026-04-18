Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373DE2F363F
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 16:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776528898; cv=none; b=QwjKp/SzJLIDbkHLqjWNL8zt67mlLYMHxD3Xacmh62Yz5qMgO7+KV++TEcr1fN2Ptq7IlI+/zmTkyy7Yj9dd9MT8Fc7J9+uIdcDD9/W6d8ZpJ+4CunqCrUfuWubLNiMhdmvVOPn09GCWqHcxJiGYJD1Dphz/u2WawLxmuY2kiLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776528898; c=relaxed/simple;
	bh=RXY6uhn1PhkRtSRQHLs4Vhi5olIFFSfIcU9r56yxy+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0swVu617kzwP8kNjc+5y4te6yjtpfMIeSOrk/bBx6oRvgqfXYa2idkK7Sx9NlbJtUpwYxpO6EdZJ/G98UBCytICdc+q86wLhpkQf8ZMrnEGM7w1IEBwkudkMiSXACUG1cNyCbHVs0lfAMMCDZO6WQJq0Ao6zACvPEolxaICqug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0WPyK36; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f9tXxjN5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R0WPyK36";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f9tXxjN5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4U9X2296153
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 16:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T4OL9g+C1Omw9ZPu5lOcBJPG
	k0Adx5HH6jKI0OnxRy0=; b=R0WPyK36njYCeJ8yFG4SfwOmrz7OME4IcGaXU3gO
	WH8BYU2f6cX1k4gMxGmb6N5BQgg9XqkMKtSzrpLzu3cCZCRA7ojE3Te7sSXjImQS
	K9OxccmJaCV5YcXVRTndUnXmLsxiHiRWQCb+/o8S2NEtYEpOTLOhpUEe8XbKxm3B
	a00eYBtsq2qgMG8sF23hlVLvlmy5l+bMNv4cCbxjjB1Zqj23icbrobaZvxbQYqTv
	DzfkBCvzuVmab7gQd+IjQFdenEcAeozf3SSK1Jl0EBYP+JFJ5qmIcqJwEDlNftB1
	Wxle0VIwpGv9l73nyhQ4J4ZB1OnBfdocdE5zIdR86aNtOQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr183f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 16:14:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8aca4660827so46892386d6.3
        for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 09:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776528895; x=1777133695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T4OL9g+C1Omw9ZPu5lOcBJPGk0Adx5HH6jKI0OnxRy0=;
        b=f9tXxjN5PrI5EUP/7zghmr5yk1mPctwzjRAURrq/AKxDMHcb6ugjBL3eaZA9uMoWkR
         9qHkyc+tOZRAnT+q8o7pJ0f7nWqdcPY150thNvyuPZK1iLjfnrjfVeul2ZAnp/CyKciP
         Aelmmoo9SUTj3OQd2D4E7RCj/BrChgJYIfBulizUFR4DeFTa1Q+Z/xzjJbxUd4N9yIj6
         vSfzb2bg9SYqWXqbEOM83GQHwXZTuU9YDZo9VUWaXVyHaQvdEo3Ey1qWxXMQLjyhWep2
         n0XtgXw5d9J6KkNP5rS4ny9RdTWcaWmC0spO15Um4tDwQHhqpLVHUiGKVBUtA0LJOeRq
         zBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776528895; x=1777133695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4OL9g+C1Omw9ZPu5lOcBJPGk0Adx5HH6jKI0OnxRy0=;
        b=IFn9MG9JaCzpkW/jcXY5Dma6m07thRGRfcC1zM6iSdYJk6iDRAohQffKWpqWMzVZv8
         zQKBAxkh3wBkLxQlLGF6n6OTeZQE2BEnR2FYvjpJLyLjqbNalMYAraJPRmO9nwnaOQ7h
         eiRbl+ZPPdokV4rmtP6fsi2Dpn8yEsUVIuNm7GrAHYqicz6V0TybIhNdh14EXDAAXm9T
         6s0QcdBI83EsSHvxrfl41meCZpoF5WOYfxW9poo84BZ35yocboGhDxTv6vXSM71vkvbt
         KnWsPFEHiYRP1NfCuEErQoBQhsDE2HfaMAHl2R1JYU/KSctUG05iThZ4lfgjGy0CoMjw
         BCww==
X-Forwarded-Encrypted: i=1; AFNElJ9g7OeQ0GvbJyCY1SjA5nJdasIuHNRsr29MR+zn6gcsi85/Rq0uooqZGt9EmVf7hWHdraM5r5sxT4Souw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbIeijFpyMenQw/GL439bpBT5ADMdb0zgh08LfaX0D8xHnpxtc
	E6hiXyf5D9snuPatZ7bZ0y0p/8o4+6AIAU5Wd2wL63elJW6PwX/Ng92D9jUFg1Vv5oMzysPuT/d
	GhKnvRFWzYvIM28jQ8f8uSalfoZb3jt7f+yswICXncniE4lV+l9JoeJD58xpNbE/Gnw==
X-Gm-Gg: AeBDieuQi7Fmy5Fcy4c7Kf4G0bWKFDu1G0DEH7Ilj9Ov3ET3vGIHDqlAxpmqqR0dk/A
	1yevTGU/q9sQ84zQEXMN8eGh3FXOOGYY6n3ycUSTTXJv/x5qrV/CfUpHIQQhPXfPAcleYxW8Nv/
	d0A2XIduGM7NGA9akktwp2KoQrQW2nkb9n+jDs1mI0+kgKFYb5ynsOX7ZFZ99+sNMKTjmRSCT2I
	Po1ofGKjLW8B4A+lozLS0q9w3JsC/MGnzvz6Mc9ptBh8iili7D5zjpDIOoh5WTp+RVDMcd8HAFM
	v+vcyDiFNWibffnD1+Rt5lZufEef9jE/7d2Vy1DEMElorpddHFgKqu/gqcdiFBvcWJwnzGLpoJl
	DLYVnFiWdgfVe04MVMIpm8vUcq4rODEhKCrKwfgm7hVZKl9gfuaQpec466Qnmcc9NJ2AZ6A6GVW
	rQa+3qixa2sP+Or0V/kz2Mgdt8r9dpSHjriEZ1vAtk5VMXSA==
X-Received: by 2002:a05:6214:4e08:b0:89c:d886:c022 with SMTP id 6a1803df08f44-8b027ff9304mr101769246d6.1.1776528895269;
        Sat, 18 Apr 2026 09:14:55 -0700 (PDT)
X-Received: by 2002:a05:6214:4e08:b0:89c:d886:c022 with SMTP id 6a1803df08f44-8b027ff9304mr101768646d6.1.1776528894785;
        Sat, 18 Apr 2026 09:14:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7d80sm1424400e87.68.2026.04.18.09.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 09:14:53 -0700 (PDT)
Date: Sat, 18 Apr 2026 19:14:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
Message-ID: <wmmqnkq4btllqnp3zyto4pqtregvfzxv2ix5consrcbejozbvi@kxheanez7ovb>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE2MSBTYWx0ZWRfXyg+nDW7ChyIl
 i+1CWv0UjKiE9D7NtrZ7zfHPL4/W8fx2r1ufNyckqrVf+LIggMfkoI6BiGSecFcA98DTOb0vs/x
 irVJtmomfUAWlioFv/64FwJF9zg4eXZtLvur6WPwG/AFaONo8etrUw1Prg7LQ5rJQxpgKrYh/UX
 xVpobaxveab3GLu62rJQh+E4hKqD+ygbqKekorqYa0ul2X6m6iypbsywYPKUjleEKqeM9nihT8w
 FA96Kq9tvr7d2Vkwln5H1RIwBKu0oybrIX01o/ZJKkZSQGSmx02/iNLOwE+ZLYYAPa+WDlTI0y6
 HqU95rydpu70aHr9zTu9z9Kk5zODP3e6ZBGbpmVZtDwLyi8ID2wdeiSpN+tgK6V0yY1MFRQe94i
 4N9xV2crf0UebI6T0mFNHG+v3Cf/KUHAcRKOlxgq5woZKnvhaj0RCXXG1DmHS+0FTXydyqbGoFc
 d1tEN8NeoCb/O0bR/Zw==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e3ae00 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=wxLWbCv9AAAA:8
 a=pGLkceISAAAA:8 a=dr5hlnbD9tG76DwkopAA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: KION8xj-jqlys3ZQXhR75VYklEyYOdpx
X-Proofpoint-GUID: KION8xj-jqlys3ZQXhR75VYklEyYOdpx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_04,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180161

On Tue, Apr 14, 2026 at 01:55:30AM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> msm8960 uses the same clock descriptor as apq8064 but lacked the
> corresponding QDSS resource definition in its resource table. Add
> resource ID 209 to msm8960_rpm_resource_table to match apq8064's
> implementation.

I'd rather drop APQ8064 mentions from the commit message and just state
that you are adding the QDSS clock to match msm-3.0 code.

> 
> Without this entry, RPM clock initialization fails on msm8960,
> preventing Bluetooth/Wi-Fi/USB from being enabled.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/mfd/qcom_rpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/qcom_rpm.c b/drivers/mfd/qcom_rpm.c
> index 27446f43e3f3..0defb3279af1 100644
> --- a/drivers/mfd/qcom_rpm.c
> +++ b/drivers/mfd/qcom_rpm.c
> @@ -324,6 +324,7 @@ static const struct qcom_rpm_resource msm8960_rpm_resource_table[] = {
>  	[QCOM_RPM_USB_OTG_SWITCH] =		{ 205, 119, 82, 1 },
>  	[QCOM_RPM_HDMI_SWITCH] =		{ 206, 120, 83, 1 },
>  	[QCOM_RPM_DDR_DMM] =			{ 207, 121, 84, 2 },
> +	[QCOM_RPM_QDSS_CLK] =			{ 209, ~0, 7, 1 },
>  };
>  
>  static const struct qcom_rpm_data msm8960_template = {
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
