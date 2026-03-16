Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2618B192D97
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 11:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773659032; cv=none; b=n3Dj/+C5Lz5FddEJiQ/9bih3lx82vpVrgA4Zs/NYpyUwqEvkdL99jJ0Zb6rLcGDr7CYE+igc6syuZzYDRsOVWyii1IC/J2z5AYfuQ5q/ox0azjrkjBWW2M0WS7WfFt0+0cCZqBjTy5K3FhN37kuzswiZmx3TtahgHnZV8otNHwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773659032; c=relaxed/simple;
	bh=ONDlb32qfrMTx81xQ6xuub1GdI9oAvu0FzssNJPtv6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ejnk9iNt6oPtJixtxLqvMBSniRb9cjBbA9f9BsDYC5axpJ9GSmlOlwZQQ8Dww7/u4mvCi8Rvdb8+5AT7cQZ3FkNb5FsfAxFrekNbPt4O1VbjAHh/rSJ72LoqSP9zAUaX1DAYOEaC3tK9Z49n3PSB6YkFn5m8f9D/ir24bMSTkQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvbbAm3C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jljJdOFE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvbbAm3C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jljJdOFE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GA46LG3124536
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 11:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IKvEpj8o9w79DY7CvTp53X7PaYtXe6EY1qdauKk/1vg=; b=lvbbAm3CdT+5AmBd
	RTS7RJ9LUCLAYXQdoAdIf5ZB1ZO0uUlR0UsTZtkFj51lNUCF18cPBuBlTotvvIpj
	+oLtAu0sgaMoljjQ2XRpDhuiYQ43zHRqFdUB/alEUxb3Tbpuo7Do8O+9Nmzww2bo
	1ZQNHfkBpgspHitB/5p0APX8ZDE5tqR6FrKwmkAXGer0TqgpjEN01TDLe9cHLOfn
	tB3HP0KsujpGmu82FcOnI856l6aMvE7a4m7Mq5jvUyKvECfk8roSmAe9RK9fPtsd
	D7hWnhZjxFMvGdbT/Gpvy/SPi/PZXztVJ5h2aXTpGzc/FHjKcR+V7ihEJUyBb12J
	x0YUvQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmg60n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 11:03:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b04db6c138so20339295ad.0
        for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 04:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773659030; x=1774263830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IKvEpj8o9w79DY7CvTp53X7PaYtXe6EY1qdauKk/1vg=;
        b=jljJdOFEughrrj+oXp47fBxgtPPHDbWBEWoYpFm5gR7P88rcqnqjUZ9oiYPf3J56fZ
         k3zu1aGEHqRsZo96I2HV/mCXNil3p9Tej4B/Z72L7ywMHq/G3SO+CZ/4FM8073Ypv2+p
         j7hRSDFGkL7k1PDrJkDm+P4C1PgL6UYvtW+OPnYVAC0JQwkhRUYHF0xPL1K8gSVk+M56
         fwTsWQlYHzKncKierX6dSKYdASngTPUglifZV+4t7c2I41qiwd3m9Z3pNwA2wtdFRgey
         Emf37BSdGDdHjZFXcmQEouGhfXVnuZ9o3jIy8gxSHxSGVsvvw0wGkfOy2CHf+6Zg1nZ1
         X5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773659030; x=1774263830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKvEpj8o9w79DY7CvTp53X7PaYtXe6EY1qdauKk/1vg=;
        b=CJbHe6NTQJffdcPLBh3JRmDAlQ/2JYCaFjB88SVGo+ZbKTOxE9FLSBzjiYYhOdy7mG
         bUlbEeHfynML3whs5AXkZqVMw8Voz1hcORhb9S+FKWrPQ9DIMKvZzJ8igpIT7erWaI9Q
         7HyiKfTL8XFySbds+U8ui1y8YQ7RXvCjwgqJmZVhfs3Rqu8cEcJHKd9NIJKVTg2ixbkO
         Z7sj6fQyNNAEA/KJ6LtBbby3D4wXaN1z8qDcBHZ+Ow9tb9DY7U4wc48r0Ah+qNRAvlXM
         Fm2kqj4ciyQrXOdgn++imSqabtigOR8V+CJmUU5ZdfePzdHeWQH2VfqHmGFULdkj0W11
         0g4w==
X-Forwarded-Encrypted: i=1; AJvYcCWq8yYYh8fCHuUCXg4Gf6/bm7om4s6EA9Z4VAMd7g5J34P7hYMeJcV0V5691WLC71DjGQGcJ7Wt/7rl1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPFuIvdG2z+4jarsJvvuWeeH6jc60EQWrGYQ9Ya7lYkc74yGZ8
	FtaVmIFkJF237oEBefiaaJ36UJOBayhroV/9KnUImFLi7AlRlUE378IHNBa1HEEP4/X9tXQGkvD
	qjd4oo/DrOJTECwLR8HV0Bca3v9SjAe07M5P4FqMKz+r19nhYNdnynxr31Klh1pM66w==
X-Gm-Gg: ATEYQzyodb2u/fcxt56n9CZjzd1hEW5W6lSFyiC3e1GDr6m0IT2YgdQ9zJ4hwLZyXEa
	ShOY2agNAWbzj8zfCQoeAAFeIxH9gXdI/awiog1qqTVxu+i41ZDRjgAZNcbVul3ekLKJF+kA3Vk
	AALEItFYOKOnAelEbADD6ZBuIzI02y8pFfAhMtDZcu/J+FlDYdFglS9tgSeF0hUDEL6K3TG6RKs
	BTrIAA2uFx4rUNLFkaElX5pKGIPh/vN7qqivIGn9W2jQ7Z3c0UlzVILHMGYuinkCTUCjS9v0W5X
	+RVYkeFjmyMhfhs/W1C9847UNyhIuQW4umvGHoiR89+Smgt4ySOZtIgeB66QDFhIjBFXxhRlVgz
	7iOMswpf+urkPockRHeqfaDXOe6YaA2BoTN3FhrHK7DAgsQpTSLxX
X-Received: by 2002:a17:903:41c5:b0:2ae:a95e:fe58 with SMTP id d9443c01a7336-2aeca959d3bmr130518915ad.8.1773659029761;
        Mon, 16 Mar 2026 04:03:49 -0700 (PDT)
X-Received: by 2002:a17:903:41c5:b0:2ae:a95e:fe58 with SMTP id d9443c01a7336-2aeca959d3bmr130518455ad.8.1773659029227;
        Mon, 16 Mar 2026 04:03:49 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0537b6567sm40971865ad.58.2026.03.16.04.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:03:48 -0700 (PDT)
Message-ID: <5299d711-63db-4d51-888f-c9062b2c7fb6@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 16:33:42 +0530
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: Add support for GXCLK for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
 <20260306-milos-gxclkctl-v1-2-00b09ee159a7@fairphone.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-2-00b09ee159a7@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4NCBTYWx0ZWRfX5CHwWS30LYjN
 EIH4Xdeblt947Sl8oEogKxSiMH1+AzhtL0BNQRq0O5pEANVBMfWlXi7cCPeS7+bSRbTbkoRn7bR
 W0oBLhAXNT4k+IOD7iXr6mkrg4LazPoXhV1MRPy9jGclX6qJYLVUD2y6xeHGmVuImqnyqPOetXi
 LCcJHMLaC49zuax2Vc0FRn+LrPC2Q67TWgJg6BY1yqB5+/iKva2HtZ2yqw2bPn0nJDZFDNWQSNW
 BGHb3wFhSZ2NbxxXwr6aO+rJ1myIgmqyBsWmFdsGAxUc3PEDt3GlX7hGH9Zh2eDih5y87BEY4UG
 Qrbju4DMiVFjtGRdcr2uK3Um7AyWi+RSoSKCQjycB/CQss11chTwH3sw16NssTYH5psVYesuCtA
 HILf+06RrdOIKELkwzaahj9r3wm0N1iDGCa7eUoDamPD0pWdhNr+A5p+01awDZw9FGzWAdLKJ0+
 tV3zgWQRqDuYvSpBnaA==
X-Proofpoint-GUID: -S8D6XAiuha5q0QeSW5Wc_8LIGSDKhwZ
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b7e396 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=m_WPT2mbnHjVYyRV6GoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: -S8D6XAiuha5q0QeSW5Wc_8LIGSDKhwZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160084



On 3/6/2026 7:18 PM, Luca Weiss wrote:
> GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
> clocks for the GPU subsystem on GX power domain. The GX clock controller
> driver manages only the GX GDSC and the rest of the resources of the
> controller are managed by the firmware.
> 
> We can use the existing kaanapali driver for Milos as well since the
> GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
> configuration.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/Makefile             | 2 +-
>  drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 90ea21c3b7cf..155830140d26 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -182,7 +182,7 @@ obj-$(CONFIG_SM_GPUCC_8350) += gpucc-sm8350.o
>  obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
>  obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
>  obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
> -obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o
> +obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o gxclkctl-kaanapali.o
>  obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
>  obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
>  obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
> diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
> index 3ee512f34967..d3899420d6f2 100644
> --- a/drivers/clk/qcom/gxclkctl-kaanapali.c
> +++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
> @@ -54,6 +54,7 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
>  static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
>  	{ .compatible = "qcom,glymur-gxclkctl" },
>  	{ .compatible = "qcom,kaanapali-gxclkctl" },
> +	{ .compatible = "qcom,milos-gxclkctl" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, gx_clkctl_kaanapali_match_table);
> 

Reviewed-By: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Thanks,
Jagadeesh


