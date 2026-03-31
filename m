Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C333C5555
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 09:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774949035; cv=none; b=lYqNJQo8syxxrI7EOP2nvotM823L0qxQ9d9Vcb0N0Lw4gc0srLQSN5ar9Ejrtd7hIWSZR29zzHXR4Zvc2Udo96q5lt4vwB9V8QGUUyaroSR13FJNXNKnHr0DmrUKHgpTTsGEUEMbB0B/nbeWNSPozKeMdkx4xn8pyFFdmt9Lovs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774949035; c=relaxed/simple;
	bh=iz/SJN64s+bT2vQ5zMgr/0dxMe7Mb9gLmpbZUXqJF8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PIdEXO1Bm749F5Y84NFRC/FnZk2UbkrdnjOgn83fLLP01L2jfxzSUUgeotrarUx6ELQjZuhJcjlJ89OHEWNa7nB+if3Dr6ZbAKrf/E4cvtJ9cIMShkZZ8LOdHJzbqBVuEcaC0Uk4cqBqnNJeJPgv66C9Zph3Pmbz4VOqE4qIm/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKgDjEYV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=en58lRZP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKgDjEYV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="en58lRZP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5s4Qb2409165
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 09:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQFXG8OxSY8MFdXHiMgryTqz9mCo95DiLKkm3TogpXY=; b=kKgDjEYV2nwPCyRd
	mPLjJcxBkpnZCFfh8t0Atks4IYH3HhFlB6Xpa68fC8f18wPTECZUZ/5sJrM1oX+e
	S35FdXz8mIn1KZXhe3bprKLplCHT1JYQFWTwIdDj3IVWh8bQxg4oQ7PATAabnihk
	cxN+bb1598xpGfNywMOhG+HAKVOgDXtAk4MS79QzIArQD9tcERIOTTa0drbAcm04
	/sRHGVDF5i1PnKnQ13h1eRJbhJjYL1HdqAMAh4omymh2ATeQCuli2tCjXsco46eL
	dZpIwDP7R7tpLBwu8mBfOTVrDgMPKlV9VDsEjR1LTSiznOyDHzRGJHEyP4s+XAOS
	A0sDFA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80hetcu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 09:23:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3568090851aso17353369a91.1
        for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 02:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774949032; x=1775553832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GQFXG8OxSY8MFdXHiMgryTqz9mCo95DiLKkm3TogpXY=;
        b=en58lRZPq4z6CX6X66L6nm3CcE5dDTvFcJYXOxfFu5o9Lrp0EH70DJzhPItnwiJmvJ
         dpK+YUO3uWhpycmglOqeEWgLlfuxq2cbUQ2WhwK2ATu3Mto1Qu6KTumI22Xe9+j996Pw
         1i6l4JyO4AxUcyv7D0ichCPheePZu/4EnMXwJIESeOpce08/ykcKAvMJJraFYHjG9+aC
         Bf6RMvBwufUJIcKm2r+tow81Dk4jzQy55UC3hIaqARGvsd6vq5kGHaCFj0WBm/BhjWmQ
         TRkB1VCm3HgHjGKA93+FiAIpp4WEPv5N8hRiPneGsGsNyS3rZ7vmZQL9a4Eq/nrKOhQL
         2SdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774949032; x=1775553832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQFXG8OxSY8MFdXHiMgryTqz9mCo95DiLKkm3TogpXY=;
        b=DzHLDRFubmWeBr365jZ69qEva3HwZp6a1vSLSGVy7xY6ZGCYslPcSIxsCh9Bci0u6T
         sC3h7C5ONV/vnraWqUEbV2KSaMp31nCIyK/NB1VPLfeIr1L3A07LdIdh7I0rL1BggMmR
         A4OTI6k0PwSKiAwGW6zAuDkddaEFkfRSqp5mWCZ5sqL7gBRSJCOAIPL1SMhPgWw+xJDi
         QrDu5olwiaNz2T7fQSS4DLZFuYMn/5Go+H1qa8P+H9kc+qJMaIw9IEBqn1byompDCRyu
         OqzRLIB55rdgYShQw8ngWNoOWtyTLQEnoyI4aGBfBV9MjOXvbxfd6ckwzTsUm2X50Vcn
         Vucg==
X-Forwarded-Encrypted: i=1; AJvYcCVW9+Z1p6vnIFKHloXJoB6niVOqTzbWmi7y+K9pNfrM4ge9C+vY/hG9S7QKJdZEqRdJO+T0pQxTOLoBxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvulBG8qvhg6i62Xd7QpuJVKhJb/i/umDxw51W5i+2hHXyOxEY
	/0/3tZh84x6oVeaTqwQA+Zol7th2Lt+UCt7lrAYI8lURSztsv+60nSD1fmy+HX7mkdrFFACsNvj
	K51Zo8RKs25LmpMbVfIiTSvPK4De5xG9Ga5TpkVCrWSDnS+S4AB82N1YVoB/4V8hfZw==
X-Gm-Gg: ATEYQzzSbEqh2fuFaOWQGPps5rK8IC714d4osiDwgb6C48ScE5KhyC5hkTXYbwHE3YF
	alMqrhabGMBK1R/rUb4Uuvaxopqh7mbtYy71NQPnDZ7Gq+qSh3Zyg5v2cDyW03JHRUhI3DrVew1
	BgcMeQIQT6RsrzLsTwryuphkpyon9SNtkJJYTfkmyHXAtBW1RV8C359Ms3PvXZUd6SjcOJHi9Ei
	SpFIdc3c+sinsFX037aziktTtA6S+cwxEqGytDzwiZas6TfaQQsptbQFKtB5JjXBYKSYlxQIYnH
	7AVcDfTAf+iZ++UQ9dADO1c2nZuKPQl9uZf3+jpK6KTpgi44TKu1ju4UPr69bxKWkSnLlyDGzsS
	ntBWSweScpBHyU/YAMn88MbAyZvYdYw9+CToCx9oC6NF8K8YrRg==
X-Received: by 2002:a17:903:15c8:b0:2b2:5491:e32b with SMTP id d9443c01a7336-2b25491e56emr66423115ad.23.1774949031868;
        Tue, 31 Mar 2026 02:23:51 -0700 (PDT)
X-Received: by 2002:a17:903:15c8:b0:2b2:5491:e32b with SMTP id d9443c01a7336-2b25491e56emr66422905ad.23.1774949031392;
        Tue, 31 Mar 2026 02:23:51 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642913sm103836315ad.10.2026.03.31.02.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:23:51 -0700 (PDT)
Message-ID: <1b729b69-a7b5-4a88-ac25-091839e40d24@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:53:45 +0530
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
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-2-00b09ee159a7@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gb0aXAXL c=1 sm=1 tr=0 ts=69cb92a8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=Tg6AtToVi0MBdbWWjBoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: QIHJYuPM_jnLC3ok0M_lMZw949v2TugL
X-Proofpoint-ORIG-GUID: QIHJYuPM_jnLC3ok0M_lMZw949v2TugL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4OSBTYWx0ZWRfXyGAmM2lbq3Ux
 YSLaYKXpoRR7Umx8UDodHYep8GBzZoV/DTcYwmUSpQUSncf2ZwC4aEZU0OO58/+nyJRjF1mL9Qj
 fTAUeA0MsdkJC/Pi5M72bw0h/vtaNJs2M5YBKVj29Idq2G6OK73dhRfwn20WLyjsn8OtvMhFSBo
 spMLAT7He0aOyADEJYqbFpEqsYO0ZKrxCJ99YZytmjoVhlVEAdD5zpNJmiXZZc+HF7vytVsIIcp
 NZQ+TNlzGhzigrQ0aXrl0t3uQzTNKYwNwsc/blsTw2x5RksTs7jKVgU31Nf3eN8rmne4VbxAYl1
 K50QnIK3trZorp0rBcFjvOfU1ReJD5wXz11qiM2grP8uyUPRoR3TIU82fesblqzkSk+1xYtD2Tk
 UeLLFuywOPQbASPwSUhwJEhR+uvkY46JPgFDnZARtmEFvvxe9wKacE3bdnuNksTcKffEI95PAuC
 ABmNewySN/wgcQdRBAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1011 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310089



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

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

