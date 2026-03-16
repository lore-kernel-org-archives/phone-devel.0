Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AD337AA91
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 09:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653438; cv=none; b=PzBmiwUdWzqybm+TQzLmdWCWQ3QB2WfNwuM3GUK9eDoq2701uD7b68sNotwPdwnDuKkfJj5bKicjioAzDumFCUpb1YQJz3RNeOsoLziqpzJS4p1MQ1djajG0u7NHHa/0qznCSNOBPOHkbOV6LRyhvRwXyDq9RcQKaO5hUR3EB/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653438; c=relaxed/simple;
	bh=rOmD/tTSLtI4sGePVuziYUR2ACOxJnPfU42NIVxWQFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J6IILbrWKnuM8bhCnH7cwB2YfMpy9Z6urAeoexonnqpmSxkIdk5DHKEHM+4Lco+GrYInh88W+KWGC5p+p1l3j7O8z8smqYulOthkNPC1iNeJHTFP5C2q2y6V2iGyCiz7SgIL2iIrwtj/TbjlqJRKED/Q6O1MQGStyD7LWo1Iwqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=koW/HKn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VHOBtDJ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="koW/HKn7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VHOBtDJ2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64eMG1282091
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 09:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bCVKI/eKLtlamMd2/D4n7rtJjm8TbWgtnqjVuvE5Ek0=; b=koW/HKn7jRlpg8rG
	CHgAzn+oKT3A0UScRhwWUQyFgmBxKjPwNMag3iOzB7gALOQ93035Fgw8COl07E+I
	Htm0JWaRNvI4NpZsFFNxeOWKM81bYYuLcOe03228k1jdCrOUJjZsyjoDlnUogV+3
	Vguf5XuJZN8jpcep5R7jTOA2lY2wDO+8h8fXCOyYtuAqTJ3Ia8x86e24gz1x4Tsg
	48kHBxsWIbone4i4xIY880tvuermVtXUqtfCztjFx+B0UYsLkoAiuHrXPSQ9Eba9
	54Ken8JoeBoFusq+pKr4ttJDUoywTpiT6sCkJ6LpUPKn4XsbbRSR4yfTHL1Bww1C
	yQOP9Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc4xyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 09:30:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89c5014e220so5824766d6.3
        for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 02:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773653433; x=1774258233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bCVKI/eKLtlamMd2/D4n7rtJjm8TbWgtnqjVuvE5Ek0=;
        b=VHOBtDJ2rXvlqoP9oL9dNbxjRCa55zooraO9zFCXrDSFpZmDgu9Yb/pcxXjUvqTmEX
         nl2MUg4CU1oHF7cZGX3coySJk4tEBACFJn86Pbqe1QuOo4msx5aBXNGaJEjfrutt5TTb
         TLkU3mI588b8nMRYeXkfOWUj4/EHVmwUIA1cmsPkYeMnR7PdEnooNsNeFK/OZAywodOk
         YMbw5BOgOYtnuv/oTuS5trgWc5SGGv8ek2uJ2SNhCIEz84U8taJp07h64WpoqyP/1sva
         bnrisZo/lvOYeY60M+Ebb7gElGGdUNNRAISPn9rizjb2cefQBKn6P333RmEGBPmLMKbp
         YPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653433; x=1774258233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCVKI/eKLtlamMd2/D4n7rtJjm8TbWgtnqjVuvE5Ek0=;
        b=OtkYw/KVp9s0lo97isFLaBD5SC8abzJSMNeBQSdjCDStH6IE6YsUZQ9q0IimGogLW1
         av73q33OcAmtUe19RtRaXISRrqOokl+d367nFqSAomDpjRnBtwKINB8b/5QjBD+wA+Hp
         dOYKzICVyNtfW/COyWSjt/CPSM0dyeoh6fmIgAAp+ff/x+TkWgQAzaTOBe+PdsHfqFpa
         kFWfQnbZeByiBd/61945b6ltfbSX9SdHTLpmfM+meUH/Z0kN9L2/1a1wXg8kxoQdurw+
         DNZc/c768aaCYHsyZ7sBFyIrV+ZUg5vzcSDxrb7yAe3NO8E3OXuHR8WpkUtB1WHhasbx
         L2bA==
X-Forwarded-Encrypted: i=1; AJvYcCXTCkE24qm97Fx2L+nkTJosv4tjfBcWg3izH4eLOhjSTGQCiomfnjUlknO+cQr7ry9jbYe0b1Ar+Z6hBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKkB7P1ozU4tQJCUZ9N9btzb4TJ1/KhQ3fZ0RCzTjUinmsvHl2
	ZJqBWpYM4tLpvR6BwvJJ3g7TlKw6gnrp89bqE2givFJc9WoCFwJSIuKxwWicBTl2dYPmW91MNDV
	ckwkdLTT+7T5DbIzGYjzE5QKONSLIc2bkPNDp7b15KMusW8813jM2Kq4POQnVv570mQ==
X-Gm-Gg: ATEYQzx2J1HsAOfMs3cwtqwlG0iwn7vusC17KZiDNUOX7jqlnb2l0KDGhHGDx1JaEDD
	ZAp8SGV0VcgXh0H4vwqkGt5VMh/7hyM71l45nEfdIkUiA0bCZD6PSMFZ3m/9OqtCmkU/pxBCvDg
	ALX4oD0riooL/W7DkdltMPJpggRzSRKpcmfCC7XPmWUtrVBdfKrulzrVZ2kUfehI9N986AWHe6g
	zCaTizYyp0Ew3visW7NlfscjJcqj0S+ZwfSKYhtyPbAg57amjDAY+6yoyYJju4GtKFIpqF4cRRZ
	h1SDcQRHNhnPf5NWFaxrVCe8wDjJUWOXJX4inH66X9ipgR7Ys7MgwLGdwo/Ie6+Cw8F7xGtiN2e
	V+U5Cery9kbXYoM5Z6AsXbfMvK1/POVZmmQmSrymbWqP4/VudEVXUWw1mgRMY9fGMH3Pc7GCtUT
	h/1ys=
X-Received: by 2002:a05:6214:809c:b0:89a:4c1b:4f6d with SMTP id 6a1803df08f44-89a81fb81e7mr122910136d6.6.1773653432941;
        Mon, 16 Mar 2026 02:30:32 -0700 (PDT)
X-Received: by 2002:a05:6214:809c:b0:89a:4c1b:4f6d with SMTP id 6a1803df08f44-89a81fb81e7mr122909756d6.6.1773653432457;
        Mon, 16 Mar 2026 02:30:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97afca45c3sm231447766b.13.2026.03.16.02.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:30:31 -0700 (PDT)
Message-ID: <e242dc13-9818-4445-b835-86a87965090e@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:30:28 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma:
 Disable MDSS
To: David Heidelberg <david@ixit.cz>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Petr Hodina <petr.hodina@protonmail.com>
References: <20260311-beryllium-fb-v1-0-408a580d125e@ixit.cz>
 <20260311-beryllium-fb-v1-2-408a580d125e@ixit.cz>
 <t4uhjpxdvjxda4dxkoxktv6xlxg3xvzyslgerluu3t2dzxv33v@k46gvwv4uf22>
 <137c19a3-136a-4e0e-b4ea-8cc474172d81@ixit.cz>
 <e65ebd79-9edb-4001-a5c1-c4b6a67d5234@oss.qualcomm.com>
 <e93d3d7d-1df3-45e1-bf9b-d2ccb937aced@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e93d3d7d-1df3-45e1-bf9b-d2ccb937aced@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7cdb9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=sfOm8-O8AAAA:8 a=xNKo-it-qOgi_xrJINUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: Tig3K-qV4UlMaHHao1XiemFa5MaZ5wNQ
X-Proofpoint-ORIG-GUID: Tig3K-qV4UlMaHHao1XiemFa5MaZ5wNQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MyBTYWx0ZWRfX3FqIVEW6NMM4
 VRpSf1ry8b1fanDKUACNKQbIBCyRXkf3vPVM0EoCUKSelo6TaSi1EovvZYrYrLbH793vs5CR8Wh
 v8GyMeA39ZI8XszfFtz5llUoyu5GpTklFJ08PAW59byu45u2PKv7RV/wG1eyeovl6HGcOBkmdPh
 kEMy/ysxX8tvO982Ji/FYU1nBml493U//hT80iakedpHRpcqU89FxW13v2bq+OFs8D2jt8azvoW
 5YY+tdBO2lfVC1aG3yr1SLkWMb7h/x4XRssDXsULab5G7CO/Z7/aZYvxrkG+W7WRKGCm2H0KOB6
 9I9pKVpuprZUD53eg4WZlyP++w8LWM76j9qbIEq6k9uehwVKvcmrAov4AIUL5Nw3a9HRixlaIaI
 TW050XiQsq4Hf9XIlyNZoKUJtlqK82P+DZPFbu8rkLy97cYnH9hj+AfTXbKy73oe9wLxbcKsyhE
 WdR6h1CsrwyDi1BCavw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160073

On 3/13/26 2:09 PM, David Heidelberg wrote:
> On 13/03/2026 13:38, Konrad Dybcio wrote:
>> On 3/12/26 12:25 PM, David Heidelberg wrote:
>>> On 12/03/2026 03:46, Dmitry Baryshkov wrote:
>>>> On Wed, Mar 11, 2026 at 07:44:30PM +0100, David Heidelberg via B4 Relay wrote:
>>>>> From: Petr Hodina <petr.hodina@protonmail.com>
>>>>>
>>>>> Currently the panel driver for tianma is broken.
>>>>
>>>> How broken? Can it be fixed instead?
>>>
>>> No output to the panel. Definitely can be fixed, but current situation is that we don't have anyone who has available time or device to tackle the problem.
>>>
>>> I know it's not optimal, but on a way to achieve working mainline phones, my thinking is better to mark it as broken in mainline until someone fixes (assuming Fixes tag and backport) then just going black display (when we have at least framebuffer now).
>>
>> If you have a person with limited time, would simply copying this:
>>
>> 2b973ca48ff3 ("drm/panel: sony-td4353-jdi: Enable prepare_prev_first")
> 
> Sorry, I don't follow. You meant introducing prepare_prev_first?

Yes, just setting that single flag

> I asked if it's possible to test, but looking at the rest of the driver, it'll need refactor anyway.

Well I'dve assumed it worked at least at some point in time given it's
in mainline?

Konrad
