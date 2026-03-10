Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8F738A728
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 11:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142077; cv=none; b=TSyWjM36sSjIu4hFJynMH/cJC9iEayhzwil/lXNq/0oj8/DZ77bPzzQ3r3DUaMnX7tihcvdceom2R+VsJ0Fa5+JmRqi/T4UqlHFervYuu05lQo4mKCEu9E9J+TJjIR6vDDl7+L32Ccez1o1cPne2k1tQalZrW0RzC+hRLpGiTjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142077; c=relaxed/simple;
	bh=L7soDEWoTulREELcHcldAeoLN6DlEDFzdxCDd5np/yA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G8oT6O1fQagApaeuJJeOLYr+qFIo7VgBlhV6qcFAVPKQ+xGN8zlegifPy7sW2kme753B8DNaLRdWbZeuCqOkmRouZ4IkJZevmjzPlhCV8FwfnSmY2f1ItNWLMzz5ee37BlbaDWU7ZpxKmtsDCrwD4zZzobsPjqd93iOxiQiYNhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSr+R3od; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sehy8Xqp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSr+R3od";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sehy8Xqp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ABHVE33243794
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 11:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qq0Xw8EQWByHsDU0TPAVQ9YxBAplfjKJxgDA++MRTJ4=; b=lSr+R3odS8Wpofc0
	PxbZxvHDYvG9BR40bYlmZe3EgS4d9FcaYS4YeIZvptjerCGEUBFfMxl+1v3cM8mg
	I8QHIwQPep/xJgM8oPy9rDcEBFB0tCPYpd4iY7AIjTd0c5uSZmtll4RYB9Tvnl/l
	cHxjsMxd0LFjM2P5SLcXYQgBMTHoY2sQDcCSgQMvVWhN999edqck2l6d6BUZ7ooP
	+GmskV82dOHoxJXi2qqRZCDpkBKFvrnE4uNVpt6qUiB+Nq6JpNVegz50hWpyRVWX
	bAzH00zz56ygdUCImGFNCKiI2wJF8/+Qu3sIfKK7aXK8LgnFdTxj5rk3X9m+8Ov7
	ndQRdQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja2811x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 11:27:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899ebdd0b08so60751616d6.3
        for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 04:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773142074; x=1773746874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qq0Xw8EQWByHsDU0TPAVQ9YxBAplfjKJxgDA++MRTJ4=;
        b=Sehy8XqpIVFauXM7rKc7I56mFgYDXVe1slgSOzPS9+CyqnI7fdy3hq1Okd0DQGQQ+R
         N7ywcGANY0l3A9xiuiL2q2oFrZV5CBtXVdvEu7Fu6BzKKYTcFhg45LuA8duLfrrJgXTs
         HWbDeKEnH0b5abCJW0mD3NaeN4CZBDsfXgc2TYEeLGVhcVM250Frm3W4/GVQJ/Yr4Mce
         3FgyuM7FpDPrQEKel+UJVFL616jXNUpmXKrG46K6hRCvaNjr6mGxACP8lZrQ6b+UDpgz
         hI+r40jWs9EPB1a22JaAlLNvEwlfYScBveYD5S0ct/aYr5sL5PrYSZtOnsCIngjE17y/
         Hb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773142074; x=1773746874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qq0Xw8EQWByHsDU0TPAVQ9YxBAplfjKJxgDA++MRTJ4=;
        b=fE86KjE0HqSget2yMdcAtGTMR4RVliO7heCYZe2RvCZ9jkWLhv1Y67u4QSC45Fwjz1
         kXi3KnZff31wsw05khJ25pHsbTjpDHyCFZz91eBB/pRaIPmZpxU24uSLC8bASA6h7rF5
         oGonA1+xhW1p3DG0aGv/2Vj6TPGS3Uk2FxWMs7RZerhNOInD2s0BfmIvia33bRhbA6cX
         PIS52Z5++qT2fO81nt7qaDFF3jawgR/WumRR5iMDIuhmY0v0ygYoZ0W9F8i4i9xxui/8
         C+McGgzZw9IywNaZkg7mKUxlX2QZFGDqtSs88wq8pARVlW/aohD1ZVogM864/h/SiftE
         8i5w==
X-Forwarded-Encrypted: i=1; AJvYcCVq9FN8fl1qqFr1Ba5bdImWzvMljnlH+6NgEXTaML+qUT/yBmmc6yv+6m9EzaIBdvXBcsUHXtkgFDecDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbhjS/hhRWjTRlSIXEzccudAczq1wq2+3afu99eFhXnGEn7MA0
	ERMmG8fUsT0Hi1P1UWrjkKU27igz2gu+jGX2gMecmonHlV2iSO5ExSkVA1Oo3pqO2tcz43Ax0f/
	4hsJoDjE4kaAcQ8uH/6T2tZmFRyLF1rX4T/i+jdrq6vCxVQ0w6AqXVeaT3auB90u/mQ==
X-Gm-Gg: ATEYQzwZFjtbrR/9we9NUG32kUm0yBHAmV342lBEDCvOjHzIsrH6OJaODfNuDLh+Toy
	nGgvjb/cLrxOb5/xzk4Jm9RdxBwvj81V2L1+KsVhphFyQ8gAWcbLke6sUnqwKcSC5447GN5ttKb
	S7y2YsIK/IQOEkGJaSibKDHEVvb21m/8cHHe1Dg9Zqq/5XJzBe86mC3xHKwHmXL935PL0+jf80H
	brkZlnpRDPDfDk4OuVrGI9YvqNsP4vD75p+ttfyfvP9pp/2mFnobrAliNayeY97CdyX0ly2axvs
	37j08lZtmMP8lQjwXqayDo9ga9+6AILQnAc0UwYI1DNxSmQKIElHXNiA+L483t46qwFq/dsU4hE
	CvbVKUb4czRpCT8lm7K/9kqDgbgx29YCxdDatxGupwOvs3baQrsmrl+6difPn7lt5L8nExD4riR
	M9UOA=
X-Received: by 2002:a05:6214:4709:b0:89a:5ebf:2cf with SMTP id 6a1803df08f44-89a5ebf083bmr8351686d6.3.1773142074421;
        Tue, 10 Mar 2026 04:27:54 -0700 (PDT)
X-Received: by 2002:a05:6214:4709:b0:89a:5ebf:2cf with SMTP id 6a1803df08f44-89a5ebf083bmr8351436d6.3.1773142073962;
        Tue, 10 Mar 2026 04:27:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8b7dbsm458129066b.24.2026.03.10.04.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:27:52 -0700 (PDT)
Message-ID: <f309905e-6f7f-440e-b463-7bda54298164@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:27:49 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-3-aa2c330572c0@protonmail.com>
 <ne3i5tmvperssm4pivae7jhmqzvyy7ftkwnacpaf4ukdqojtha@53mhrxlraw3k>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ne3i5tmvperssm4pivae7jhmqzvyy7ftkwnacpaf4ukdqojtha@53mhrxlraw3k>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b0003b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=sfOm8-O8AAAA:8 a=yvbgvs5-uoTajdXvgSQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: 4BaeapJIF86LPiFD0SXVk2aTHMCaqwJF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OSBTYWx0ZWRfX59T9fty7iPmt
 BBPHJWYjpRik7es3uh7jXTGQoTEddtkNxk2h/np1DjpVw+FyzzuGKfJ80uwxCCJn7UIoQpblAqk
 XxxomYozFz7R9tYM0Kk6xbhShdoawJzcCmkqaJUI6cXvxe0snus6JRBDff3XnsGUFS7abuoQWsv
 +41gfbvOzOm7e6h6xhw7VDqPLJQiOGz02wglpamFpOMZfu1WYK1CN8+4Vs/0l6Q07fro+q5lRIE
 YD6Q+83ppzdeOd7f3bflyq1OCGMJQr758NLj28Y+6qRIgn9lLUh9GI/FAOkfnscbHrePopf5n8a
 K3n9a2GZExTPi/2/7Rx1oJtb2lKJxNtm6uJYcJlumFj7G7Sj37afqvnsoP8HFv+WlQkKuxuCCCv
 qXPSDleqc6lK03YxFeFUq0b2Pd1RoZ4QWtmkkTQGY/hqQwPsuWwwIX0m2qGKbrw/0DMxSAB0Pl0
 EaSOruXGJCBYP3XnmxQ==
X-Proofpoint-GUID: 4BaeapJIF86LPiFD0SXVk2aTHMCaqwJF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100099

On 3/8/26 4:01 PM, Dmitry Baryshkov wrote:
> On Sun, Mar 08, 2026 at 04:52:43PM +0100, Cristian Cozzolino via B4 Relay wrote:
>> From: Cristian Cozzolino <cristian_ci@protonmail.com>
>>
>> Add the description for the display panel found on this phone.
>> And with this done we can also enable the GPU and set the zap shader
>> firmware path.
>>
>> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
>> ---
>>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 80 ++++++++++++++++++++++
>>  1 file changed, 80 insertions(+)
>>
>> +
>> +&mdss_dsi0 {
>> +	vdda-supply = <&pm8953_s3>;
>> +	vddio-supply = <&pm8953_l6>;
>> +
>> +	pinctrl-0 = <&mdss_default>;
>> +	pinctrl-1 = <&mdss_sleep>;
>> +	pinctrl-names = "default", "sleep";
> 
> It might be better to move pinctrl nodes to the panel device, because
> they control the panel reset pin (rather than some kind if DSI-related
> pin).

+1, perhaps let's rename that pin to panel_reset while at it

Konrad
