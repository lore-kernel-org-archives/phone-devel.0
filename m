Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2783A7F6D
	for <phone-devel@vger.kernel.org>; Tue,  7 Apr 2026 10:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557288; cv=none; b=TanfvQwYc9+2vnX7tVRe6GXZt4FMYEJBSyfE5xXiuIOZ5n6Ud6opGeWV0CLRsMSOt+rquPolzlyAFKcZDDwDAqtpVvSbC9GQ/NH7e+svzSqQqJUoYwufCRkibwZDqqJ1G4Ncf5S95LXllhIeJTmxl2VswH97jayLXhp8nj428KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557288; c=relaxed/simple;
	bh=k4XUKpLqkubWWFx6MiS4fNCXcrWR49bP8C25WodCErA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IfwQd1B+zlP0pjh7U4ARppyDYxoQ0zPIy/ys8WKA7xAYTJ4Y0qpuQRxGNuvSXjTx+NMFoMX75TiO9uaT40ORU9mLMs2K5+AWd7B4Taq2jguKFpdBxU+jh1u2+G27OwUuw5gFc5aDeBqWC6jIBFz8hsBO9VdcD12VwhaPESm0XYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CH0qLK17; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kmyqcG0C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CH0qLK17";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kmyqcG0C"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376YrFx1405987
	for <phone-devel@vger.kernel.org>; Tue, 7 Apr 2026 10:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZguX743r0gyTJOc5bBbYAt/gY8tHuQCdVrp7L/+iEs=; b=CH0qLK17FEtgjhjb
	Ycsawe15Ha/kzERSKqayUsfpqMpGg403oM1DPIFsCnSzL7aUYLGgF8Jb6+yjE+PC
	Zq0F2bZeVCOAvP+24RkOFkNE35ZNyKRfdgCy2kwmmFIfER9QodnewfOzpEfE6PnG
	30bryTZHm9AicdVWM0Nrgb5Zjl8TV8X9PZvUOCT61DdIRomPK5aeUd4uuoGpGb5J
	TD3Ft22WG/+4R7SmI4Wi8yrs19xbun2ocMvQ/twqt3o3LjWFIQAf3hfXFwAa/b3Y
	yATlfMKl06dv0mIU2ha6M88HzkpkAx9nxz8Qhcfvd2dxvfZ/6efi0jXoiKtBLw9V
	V9TNzQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrat850-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 10:21:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb456d53a5so128374085a.2
        for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 03:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557285; x=1776162085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZguX743r0gyTJOc5bBbYAt/gY8tHuQCdVrp7L/+iEs=;
        b=kmyqcG0CCHmjvVfAyLxqDOJQSOahGMSG5vcT6cVJRXeIhQdO42Qa6DrLmp+ofkAsuc
         nOikyEvl+YK4smij4ysdn6b1ouJX8yGveePPCmXoonufS6frmGjPtVX/NtF04ull3uyI
         4LIm0EiZ055G2uyKtZTSLPsPFPVIl1eDx63N/7Mcx/Vv2rDK1q2W4+PJkp0Qf5Q1YZFV
         g9NdBTv2BJ9cUNnrjk1hZ+7pIxn2xYuBgm9VPThm7hLB+ISDms3ZRDJltXOgpuUy/m15
         2PE6DVIHYpw/RRgWgXKByhCSEs7p/oxT/7+8Gp71LHnAkxiOBNMg8zLL3JW4NmMvtKdP
         RyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557285; x=1776162085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZguX743r0gyTJOc5bBbYAt/gY8tHuQCdVrp7L/+iEs=;
        b=Ok/9OnymHU7Z+Y8+9uyAM0M8MT1mYQgsfdBG8SMk+WfDjkiuepzDIcfOt3sxh1h2Zu
         r9VtNUroJZ4YJk7lcoJalYPqah8pW59LqqIomFTIWzRJ0losOlz0wg1VUbhgb71b4clq
         +TLlQCTjhJ73XuMwscmECLpqUR9XOaWDDZk3OnZP2w7lYtVzZhlDNlRUNZLOvUwQ10um
         As7jP+eypXug8TtOWoLjnAvbcB4ejWmcgLsMTzV9rK/7k/E0VAYToV3EJCq0nAn0foHV
         CvOc7PwCbKy3wZClPMHf3AiWyAsS2mZZtDlaZ0GgH3iQL+Vj1so/Bh/h4rb66k15irr6
         Ka3w==
X-Forwarded-Encrypted: i=1; AJvYcCWOEqH7smuSCNE492wBk2BvjKlgCZ9EFfyCD09h2mRCcmOXcyIOuecZRdIxLNX9GLsAgBM1OuLkfb559g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt/PcrWAI7p7/x0KazqPAlD5/ROOsrkFa5CNltp9otxhdhW6RV
	fxsyC1/4DIuo04uLH2/8+reUsvOVA5mj4GBNaKRLc6A26BllmPjvh+BK+P7sM3BjBvNZhGYSHvO
	HTEBJ/11ZVdEJid95A5TBU/zq+uc5Su2LjJwlE3s8lUm43uYlrZ2L+rYDWn8Xu4qKNw==
X-Gm-Gg: AeBDievVAjCeWezEPUP1NC9vCidrM5TbSgI7kBMjjdI7oGl2RtZbzjQVCe4wmTVTwcE
	oSn13tfgXXaJcebWre5R57xS25om/Gymij9cQOfcUwU0QPqLUN1RwoElEoQc6ymJyG+DJVYpaGN
	vZtJddlWfnw2XXcHfTFnj2ZVxglzF2hn+gNQ1v0XCWsvMLS2QrOTAOhely1ZiNnTTePSjjMuKch
	dwKND3Fxt7unqnBHMo0qkwf2nKNPgxseDWelmG0+aOGXD+I/2xlLOOyA2ncYk0v5SvYlgXo1cun
	4wsy2sc55P+TGdEcRW5h8VwzwKYiaBBbOkbvMwGu13rKIfdU3jmf9SOmrSh0uD6kJOScAe7HSes
	tmlXMb8LEiRN2zVdG4QDSZ8vhuZc8DmzDWMqENIPsUOEO5XBazFA4DVEmD7PGZzzpoHzA1eB5Hv
	FpOSc=
X-Received: by 2002:a05:620a:2590:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8d4185cdecbmr1609798485a.0.1775557284946;
        Tue, 07 Apr 2026 03:21:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2590:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8d4185cdecbmr1609796685a.0.1775557284508;
        Tue, 07 Apr 2026 03:21:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034bc112sm4047545a12.25.2026.04.07.03.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:21:22 -0700 (PDT)
Message-ID: <0e558d0e-4306-45d5-bf1f-df692c3a10ea@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:21:21 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add IMEM node
To: Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
 <20260403-milos-imem-v1-2-4244ebb47017@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-milos-imem-v1-2-4244ebb47017@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Dh6SlCvn3UgDy0WOzlq0ry0wnX83rJPn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NiBTYWx0ZWRfX1i6ZnN6QgCxk
 y5gN4ufmV4fzwsB7P+A39Ueqkj+e+HK/ibbOBqFjZwymtYBCG8sNhbiiH7sNObXYxz991c9VBTd
 +DfMJ0OIMSg3NiWFAUS9Rcv3Tja4HdO0BUn6HUVf64bLz3iuQxPvwjmmHnJdWbol6db77zDk8CA
 b8bmOtmmvx4mljewT9oNLAEhBvxuaGBBs6QtxjEbatCIf/oE3L1bJmIx1CuhJuraFANXprBdZpw
 4NiKj986nlOJg722Y/8PmvACDI2RyqoVKdG6WtyI9RRSvSahFTTzw+deeR9t3avlS7DdzJMntcU
 /KI07gHDGzk2yEZulEoGC+7Ho7idX6OGCd8GXeBLr3wT4BkVsczz2155SdS7gQz7t6YALWbpOxI
 +MWYf1IqStdZH1YnwAFoZ8+dXkWXuX3lG7b6EhK0ytF0kwuKqZc7Et+A08H9Zal7xIpkG3X4dcE
 1V2h61NAONvkD8of4aA==
X-Proofpoint-GUID: Dh6SlCvn3UgDy0WOzlq0ry0wnX83rJPn
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d4daa5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=jsmoW5eAAA8I8i0BJVwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070096

On 4/3/26 5:00 PM, Luca Weiss wrote:
> Add a node for the IMEM found on Milos, which contains pil-reloc-info
> and the modem tables for IPA, among others.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index 4a64a98a434b..1c045743ef77 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -2289,6 +2289,25 @@ scl-pins {
>  			};
>  		};
>  
> +		sram@14680000 {
> +			compatible = "qcom,milos-imem", "syscon", "simple-mfd";

With the new compatible:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

