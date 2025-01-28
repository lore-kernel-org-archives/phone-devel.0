Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E93419C554
	for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 10:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738061159; cv=none; b=AtLbeFKtw9lX1ZC9MtQv4sW5pJwft8s9IHX0wZ2mIA6rSTIMvH9woaXMGFoDjGPvEH9bF5QKdzfCIL0NP4/1v4rlw0SRqXB8XRYZqQPqSfcsEkyvSLrQppUdNutSuusUgAF8xtib8iyBcW7MTMvWInxnvNIsoSrRs7l1fHmY9OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738061159; c=relaxed/simple;
	bh=GJMM8b0YGs6hY400QPvNBX6AR5cfnc9XZ4UHVNpX/rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R5RKB2AvAQgufv/Wi5/vqz+CMqMV7fkBHjAQORNC9R6oVk6NfRXKnfrFvceJa7yD7IHwvbjqBq9qafinLEZHi4bpI883G6dNwC3+R+D76YehPAih15ldk8Xi7Yje0zSCA9ALH9R2Z2PXfXRdV1PFYNL43P5fardI+NyolwoCkV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TybtrqSL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TybtrqSL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S0DtAN011427
	for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 10:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OhsgF7rKwe5JIC/AdPCbzMZyNaFWY1m5uKPa21q85mM=; b=TybtrqSLfqTg9WlU
	WcFZgquIjsrOe4SZBTlQHaAD4RYXGzlnkO4/Jc/GJjzEOG8eCMyFos/tx9dmmfis
	dbIt3NwlJ5ez3ChTaN1xcX4bAH4oGDvlu/wKbQ06IYE7rDqlCJbO/M13EcpS3Jvj
	hznIo5RYCPSHBfdPwUzY/bByH1zvoeJ5ISLsWAa2VFoi46AAVTAH/GqizhTzSe2U
	c9x3kEBnbBUm8TyynpJtimUb0UGqoTuC3wAocJRnUtj/6rZ24xMU0NzFeUlONc7P
	5kJhMGKBZQ4mV6DMWro/GxT8dZsAuO3a3QpzczSnSNQ9EN4QziQ1tdJsx03mxMTr
	zf800Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44emgts3ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 10:45:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b71321b993so79746785a.2
        for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 02:45:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738061155; x=1738665955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OhsgF7rKwe5JIC/AdPCbzMZyNaFWY1m5uKPa21q85mM=;
        b=keUwtcj7n+Gnev8i/dffr700BBzOLNMjqrrjus4f2t0FkCglI77IY/OWbsjFkR6cYH
         mc/PDYPp1+j5LvL8qie1owFeGBQUyaH7tpZKk5Z4YpZSwG2wpUGkXrQd+AX+3WeVDKLr
         ThfclhMdcg7vQcjJPHfJyblQ+v/Eu2M9RbIyVoBAjRLhk2egre1WKOWgLHiGWXaDVpRD
         fqRlyMpLKI4x+SIHyfW37G6ZQLEmIhMOEWucbB+womE0fcDhUN0ZF/riCAb02wj0W0kF
         0CrmURq/i+owHSwU7cnGfSQWoCzfWjQbDU08jDTcWmuoamaoDRVtsMMyt/EE4qkeDUk9
         x6VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPk1Zk+kVGcgp7ehnSqyIB9121rOXxFm+qe/CxjmVXhhYdyLAbhBnb/0y79rth66uN2HXWOnwwC4D+zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuq5TvpIlU147lrXgeezwNz1tYLDWodc/ZNRp7MDG+ZdAsISI3
	UFw7HVygot6ha+xVsOYSGSkAdhfQQfv63G3rpYlr+TZKAsoyiXn/4WXGHKUdsHWX518P99vnHBZ
	rK8NQwtgp0ZoF+0O6+n/7wihv9JQQl95U1FeyWtiiGsfqBJzROLUqXOf4bqNgNQ==
X-Gm-Gg: ASbGncuH1pS2g6mj5nQvIT1vqtaoZsrz/evIZYaqraZJNWxTV2qXDf99VlpqvOBWHhp
	RJOqUvd9MvOSYWvG2uh7wjaum7ThKN8XWOX216dujuUHGeuO5Ye4SJdUuDjmtekWOSbnH3lhUpt
	f6E18vcSPKCcBYJ5vqNlyEIxFKgLI1y7DACiVEMBeiKea8aDYVAyLZ9Rs/QuYFeRIMJYMWSMKsJ
	5UOxTeJnWyjaYjlUf950Eaxh/uvB0lu9YTxis5T3X8qis+Lz18yLwOW1EIPbs+HSdrkRpddBR8X
	CF6XBoywip608m00mDu3wPez5fVoWPoZnY9eb3thRjrx9NQFVrPkMVwX01A=
X-Received: by 2002:a05:620a:254f:b0:7b6:d089:2749 with SMTP id af79cd13be357-7be63208909mr2263811685a.7.1738061155466;
        Tue, 28 Jan 2025 02:45:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+FDki7Hsh32PGe0Kwr8rrgkS9gmvZ9XJ3Lcqs2QPF8jw+4HDYwrPfciPwydWMrJyTCkQ6bA==
X-Received: by 2002:a05:620a:254f:b0:7b6:d089:2749 with SMTP id af79cd13be357-7be63208909mr2263810985a.7.1738061155103;
        Tue, 28 Jan 2025 02:45:55 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760ab363sm760272266b.114.2025.01.28.02.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 02:45:53 -0800 (PST)
Message-ID: <5b0f9cd4-df65-4963-8d6d-5bdf759ba0c5@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 11:45:51 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/13] remoteproc: qcom_q6v5_mss: Handle platforms with
 one power domain
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-4-67e968787eef@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250127-msm8226-modem-v3-4-67e968787eef@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nsvoUNNuH5VTvrkn83o-46skalHrk0RT
X-Proofpoint-GUID: nsvoUNNuH5VTvrkn83o-46skalHrk0RT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxlogscore=962 mlxscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280083

On 27.01.2025 11:45 PM, Luca Weiss wrote:
> For example MSM8974 has mx voltage rail exposed as regulator and only cx
> voltage rail is exposed as power domain. This power domain (cx) is
> attached internally in power domain and cannot be attached in this driver.
> 
> Fixes: 8750cf392394 ("remoteproc: qcom_q6v5_mss: Allow replacing regulators with power domains")
> Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index e78bd986dc3f256effce4470222c0a5faeea86ec..0e1b0934ceedd13d5790b798afc95d68a8314c75 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1831,6 +1831,13 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
>  	while (pd_names[num_pds])
>  		num_pds++;
>  
> +	/* Handle single power domain */
> +	if (num_pds == 1 && dev->pm_domain) {
> +		devs[0] = dev;
> +		pm_runtime_enable(dev);

This call can fail

Konrad
