Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1796B1C3F2B
	for <phone-devel@vger.kernel.org>; Fri, 31 Jan 2025 12:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738328180; cv=none; b=IPCVgn3yKYtAGQU/HTLtkpwX56I6HuOQNN03xyXr170RPb5w6TT50yg8OrDV8v+Zz/XupcbduRo4ZuxuU0QtTtTj55z84rvlQdwRil+C6GtjQ6lDMHDAOb/Yob94SsVuTR+BYhEYT3l4EIdo7HwriRlnkxtb6Ccm/iFG4eDst0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738328180; c=relaxed/simple;
	bh=UsFe8VlEZCmQ0sbihU2b0JFZi9Ej2TKBlU/qdva3I+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bHuRmzCFrjMQgeTor7Fm7kum6DqivijFlWCckmS9jwgLBNLV5T6eOrBEpmv12kDn3x8Z76dAH0uog9h28xEm5I1tDr9y/bpsIs8kQPg6eExUyTq0ryetVwQdsh4YvMyJZU8WpdU400SwL+AQfQRwzzhOW1R3FrKR6mBQRGxqbag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgN5Y0x9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgN5Y0x9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VAc3jI018801
	for <phone-devel@vger.kernel.org>; Fri, 31 Jan 2025 12:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	plPbCbgdcFippG/lsXp/DeHtnj+WORRPmcLa8nmWJkc=; b=jgN5Y0x96Go1UduD
	qPTkezkZNl4TjSCDabOLqPG5SZpYJING4ZSY53LpGiqCD/dhk9v1GP59UPmwgzNg
	+bXi/QmM5eFMpVyQIzOnRDDEFF5U4dQHmTgDPFRpZ2Vp2U8HGDZGWoFCL2Urw4az
	p4lNBIpcgnxP17yQXy1fqHgJ62AuhkgMjI73j+9z157Q5D0gqPuecRaUixIg+IgL
	tT1YM/zKcW7hYfzJWOHsUqd5VEcQN21F35FpUGyXHLRK8hisiJe0mxdFHarc1WP2
	uWAICI+NeTRDsDgFmpPfDCyd07xNij4TExRPYphccjqkMmxeZSIvNfRAWXppEIJ8
	iOk2Tw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gvx9gb0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 31 Jan 2025 12:56:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d881a3e466so4663456d6.3
        for <phone-devel@vger.kernel.org>; Fri, 31 Jan 2025 04:56:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738328177; x=1738932977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=plPbCbgdcFippG/lsXp/DeHtnj+WORRPmcLa8nmWJkc=;
        b=YVXO1ICu4Ij5WgZ59Dp0ktb5hRkY5GDa7MuvYOrUm49S/O53OOH8dj58ckSlrKgRTW
         7CmmnC1mJdh8e5K4BRDlB1QI1NeQ5Z6MBkPldWJBh3yylsQZ+qvDyHj+ZNq42jrgraYQ
         cGttztSQAPwuqvCK5qsCRvg3BsHScXe/vN9iTcKmN3DXLmlAHqHltJG/1KcUic2ijD45
         mt8OPOmwOWdrV/mraSGjmthFSZfLDstyuBl9eSSQfnpyh1gyt9dsAO/BDeso1eCwQyvD
         aCUdKBF43UdYDnqCj9Tp6YiXv38Cc1eU7EXQ5bCznTFb8iIdmdWy0j008QRqORtBQTPy
         byVA==
X-Forwarded-Encrypted: i=1; AJvYcCUBBbQMLl+Be0EBmqXnFdEOpwJ+7SPGV+L3cSn/2bIYrQYgMX8x3/W98TO4fiDW0WduDzLAlnHTz2LdoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWHX9iOwIPRbgEkdURrk0TaID0m+8EQOOhfqCelKMOjti3gr5V
	KA7L0mCgplVyx2YX7+DbQb7ULMkaPzFeP/Z1Boba8LcuIz/1LLfszUVGQK6xTfiwa/C6PA7+QCb
	qJ3F4FAEOtzc3AFJFsFZ4fCL+By2USt2nP54N7+T7D6ZFxRBmcpEyaZUmlSOM+g==
X-Gm-Gg: ASbGnctqs+5n/8fgjiF3EgCDBh/2GKoot9buOvKO9vf+6AX2QDZ0CmxbZrkiCcew3B6
	+/XzzW7AdNR7/qe/Wz/lcU2ASw+EfnMCqOjXSAZQm+CpIN5POKQxBgaH5FnOqNMg7G3I32PoFhO
	EfVf2OCCM5QEK9sKTr83FQv8xQCXtf/IYqcP9uab7U/0x3GVIqSUZmOCylt1K+y5DsIubotHah4
	gA/9KOwn6LR5fDy0iVkLu2hcTkdjXuSg/DvoX63PbEbASIOqsNBRiYposVuNRMLyAJjTYzJ6tTw
	+nwt8SJOUWscTo5goI33sxCrc0k3UpFiTuE2w31kgnznBgXLSRzA8pz3kWM=
X-Received: by 2002:a05:620a:43a5:b0:7a9:b8d1:a26 with SMTP id af79cd13be357-7c009b37be4mr397854185a.9.1738328177128;
        Fri, 31 Jan 2025 04:56:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGm9+/5z7jb7xy21B+AJ8JUsYwxTcI6SmhkN7nHUwGclLh3z290C8ViPSJPsRA1U3ApIjkHg==
X-Received: by 2002:a05:620a:43a5:b0:7a9:b8d1:a26 with SMTP id af79cd13be357-7c009b37be4mr397852185a.9.1738328176714;
        Fri, 31 Jan 2025 04:56:16 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a31531sm291583566b.141.2025.01.31.04.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 04:56:16 -0800 (PST)
Message-ID: <e9fb5ee4-9ded-44e7-bbfb-cb2f897015b5@oss.qualcomm.com>
Date: Fri, 31 Jan 2025 13:56:14 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: gcc-sdm660: Add missing SDCC block
 resets
To: Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Craig Tatlor <ctatlor97@gmail.com>, Rob Herring <robh@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20250129212328.1627891-1-alexeymin@postmarketos.org>
 <20250129212328.1627891-2-alexeymin@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250129212328.1627891-2-alexeymin@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dyrDnLN67Z0OhMmBCWlYDwHeNQX_Lwia
X-Proofpoint-ORIG-GUID: dyrDnLN67Z0OhMmBCWlYDwHeNQX_Lwia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 mlxlogscore=878 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310098

On 29.01.2025 10:23 PM, Alexey Minnekhanov wrote:
> This will allow linux to properly reset eMMC/SD blocks.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> Fixes: f2a76a2955c0 ("clk: qcom: Add Global Clock controller (GCC) driver for SDM660")
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
