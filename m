Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E01C1AAE01
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 09:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687746; cv=none; b=o7jq1D6w54IcaMRaC2VNre/UXW3cheamBr/A9+8uCjDlHNKDbUrCMzHrSHaQmeWGbSvZY4ZuLM+f2lZj+4Oe6Lf8DQFGS/+ty0e7mc71eGjCqR6pTz1lAmBZ3QjhxWqzUEiJASbqwLyzEr+FnfBx6X7Qn1fw9wsutKATq6jzjo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687746; c=relaxed/simple;
	bh=Srb/IMApP0AmNywP55aONUjmWy3LzpeEFQ6056YKF3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U980zsQSu2Uo3xTJq6cxjJxM46m25o5FztZgV0ve9EtbTTrQFPnDIRQ4FmcIIWJYUHrO8DTR3Oay84jPaQcTNiM8iwz65hrJuwJ0ZhCxgLR/IptNp8gScZJQPHGnsUOkBSbPdBzkRqHInmX8ixT0eGUjewfo8okqPhXCY1Qm5Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LRSy3nJ4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LRSy3nJ4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK7LlCm028159
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 09:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Srb/IMApP0AmNywP55aONUjmWy3LzpeEFQ6056YKF3E=; b=LRSy3nJ47eVv1x/r
	RYcMFHq4QDGUTLr91PB1Tcx3UhnVVQhxqaLKe6bKqNPkQC7zSaiVo9njvksGR3PV
	Ec9SYzXUZZdG96+N5E6l6hrMTpC107YsVG220PXuPtxxvuNz77sCZlBMLq3cTwpB
	saQEH4ilPtHjz1fQ8WslLvjLeEI/fu0PA5l3XcAD5OWJkTbREtz9wWS73kFCjlh4
	kYXXAVyJ5wBNLGmXCVbxFyUKrMjev2dGIiFfvkwK9F5MdEaMqO06Vzjot/gZcGvo
	g5PSkuZazzLAZ+3cK5QnKLcAGCADdtUI/h8JSNXbXwLTaslaDB0yXr/zaD6Vxjyo
	ayRuOQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n44ggcv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 09:42:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467975f1b53so4333821cf.3
        for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 01:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734687743; x=1735292543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Srb/IMApP0AmNywP55aONUjmWy3LzpeEFQ6056YKF3E=;
        b=YlmIkzQFxCjJrVUW9GtmSs7xplK2YgQd1tSX4SR4VwU1NrShJNYoTXwyhiIcra+m3c
         9r5GOmI++NiXAs7bAJwwf/BrXDJnvQL4FfS/D4/AZ/mW7g1Wl3GE1AzKd/1MhmQBr8sW
         yDiEI1Luu1lghGsG/0hRqZYNmZQJ+KPEB3hNk2GlUMgHkszFKxBP/FB5DlO2wlRAR01R
         sMcqOhA0fafdNfWmdPlrB/bfZWh1AGSdGVF2/0+KPdZTBH8E/SEAwzPxa/EGdfscgLWK
         eNuuFDOl/pPQqPP+k0VbuDL28D3+qmrAC7JKHrk1cMa26g0O8CL7Mg6DtouK3NAv1fef
         kY/g==
X-Forwarded-Encrypted: i=1; AJvYcCVw8cEqYSANzrjsRAyP9hcAaikat1EdY2YUIelZBjjM6obPMwRs8GFSAWavVbUJp+fTrcpGN+H09yf/2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp494t3W78ZHQanFuvcxA7ciR+ODSMoMxU/zXm7vsvlTrFuLa4
	UvQCbtuYRyr8gYWSzD3rpTkEgYrudfUEti3dw3kDs6zyLipFSaTYOoFpYFb8dIAE0kRC5ctwuzN
	VOdrPP7erUA8byp+BDqWGf3ZDJNIAv1HeBtUUSDiLLvkcgIllaagcGEZ5IzZNwA==
X-Gm-Gg: ASbGncsmRajhEVE78qBvF8ZiFsBnQcunlaputv3/lyeGRNk5PrmvKZZN44WuUhYqWQc
	o1OXZ/YctWjcj91S9J0gLjns+bz4tUA0A6oZWK0H0bAqMktNfgKExk1dOjKViE+Pfwh241kvgEl
	ywNB5ynI6zadUMLAywa5MC7dode5Z5T89yTgsBpZtTD7rSaX4tGtEzVR8T1YDDLfutBXtogR6Kw
	kyf01PNHT491DHuKqCxTazr5xlUgRhfJLtQOauslnox6TXVnvLXBp7CH0RuBryjonlWSFL2jD86
	IlzrrGZk+iMWRdNxAc8WITMub5r98SV9EWA=
X-Received: by 2002:ac8:7f14:0:b0:464:af83:ba34 with SMTP id d75a77b69052e-46a4a989db9mr14370661cf.10.1734687743644;
        Fri, 20 Dec 2024 01:42:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtVFYoZr8OVyUkQYL9m/mvQSFGgdGO3w4czfWfr5Bk2uAOQJsU+lMK0vdweVrYuEj46G9JVA==
X-Received: by 2002:ac8:7f14:0:b0:464:af83:ba34 with SMTP id d75a77b69052e-46a4a989db9mr14370531cf.10.1734687743313;
        Fri, 20 Dec 2024 01:42:23 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a41esm1545415a12.1.2024.12.20.01.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:42:22 -0800 (PST)
Message-ID: <d9309db7-e208-4dbe-b408-e637566ece4c@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 10:42:20 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sm6350: Add missing parent_map for
 a clock
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241220-sm6350-parent_map-v1-0-64f3d04cb2eb@fairphone.com>
 <20241220-sm6350-parent_map-v1-2-64f3d04cb2eb@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220-sm6350-parent_map-v1-2-64f3d04cb2eb@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _mxZdM3wgf4UHWRyCbZUjS1y6dyu8zgN
X-Proofpoint-GUID: _mxZdM3wgf4UHWRyCbZUjS1y6dyu8zgN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=871 spamscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200080

On 20.12.2024 10:03 AM, Luca Weiss wrote:
> If a clk_rcg2 has a parent, it should also have parent_map defined,
> otherwise we'll get a NULL pointer dereference when calling clk_set_rate
> like the following:

Same as patch 1

Konrad
