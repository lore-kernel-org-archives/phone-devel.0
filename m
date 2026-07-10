Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A512E1C4E
	for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 14:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692253; cv=none; b=OX1X/xtgv4UGi2RtW/kmXaBpZtJ+rjq/MFnETGviA6WLCe5F8bnPRFGCNfh8zzw2MX0m9QdExsA+3jDHPuYUk1qp+TON8KPOKQI5UduptPRrfrs+HdDTw8unL6qm+m0bRVggHfgErRKz4bvdbKrA7QW6G/OYqDYHVAkEl6/NzL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692253; c=relaxed/simple;
	bh=hWmKl4wmptrKz+5XBCLWWbjpeoeG+4z1lfyPJaErS7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GAR6Obna3Lw0pJwtlYl8wFnZijrJZJT2N7E0OjzWSf8vo1W/2MHLY2jA2a4PvdrWwqhx5kxNS9MC9GmFYFNarmaxwl/zCaiRPG4ivCK++Aps/ROQJd7SsMPzaUZ+XEqsqwzoTusxzWUzZSqnLpyrduOy8bc2dtR0iXto8dodmoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BbehK0QK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CVnCyikS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbehK0QK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CVnCyikS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD5uG8910230
	for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 14:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+XJCJtu8fH3qzIlMem7W8KbzE3wBnhOhZ1Ej9WZ5SDg=; b=BbehK0QKnqLrS0QM
	fryYAY3GD1oikiJsEeFEFPbMPJhrcDs2t/T1tnXADN8xvhQr1zLpvmBJV2EggxtH
	xj+phWHork30/qKYMrHV3KSLRT39rBvv9H5oCo9JwkTkW+H82QaL1CrAmiUckS26
	auVT/r1JMulGbKO5Gpr4xKj5JtqjmswvBwOxR9iZL5fxNWyzUpmOjd0MujTQ1VVq
	Zf+0LjEb6hKzn6jHo70at56X9+P3Jl9prHI6BWGQNUgfh+5/YSspx7lqjibfWkWk
	DWZP4pZ34s3rtmXY3FF6a45G7e9Zb+IsnE01DJTt0+y0arip3KcQjEPL7t1Uzn+E
	J1ql1Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanweatra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 14:04:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e69a569ffso28716785a.2
        for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 07:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783692250; x=1784297050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+XJCJtu8fH3qzIlMem7W8KbzE3wBnhOhZ1Ej9WZ5SDg=;
        b=CVnCyikSqPZJ8oTT6O1wqyF4Xu/hnjJM2xeqLgi+OhU7pggOiXGq+kxrymz2RzPkXJ
         X26y3EEF2DIkjb0IB9Pa2noIFYNKuVskL+VlUFfCKnRZDpxiOph+QRyWev1SH0XxEcdF
         squRGYVHZpUDL7monpOw+W2jzARhhq6uDBuXoi1vSdA0rEK6Bt3iFfKtXjI3k1KezSiy
         s/Svi/2IfsIxE0Lb+TGnuW/v31dn4VKEOBgIasKXvAp56ZFQMv06TH+0xJSGhwEab/8T
         isbppJXRzQHcBvHvspZUMleJyCOOzT/k8wiWwhHUvwiGIDEELQt1wc8VXZwcsy0NXSzR
         54+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783692250; x=1784297050;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+XJCJtu8fH3qzIlMem7W8KbzE3wBnhOhZ1Ej9WZ5SDg=;
        b=ed7xSaAJRqLCkjqr04DVCk4Zm7aA72eeuQzF7ztdlu11k5dvQsLnjefWTeXAOxTkFJ
         vBMn2KB2R6MxgbfSJcEZZ82o0tvM+EfpiaoK5Tz7eaz9Etf5nlgBGpwSqY+Jh44ZL30n
         QJES216SLhExJShHRsB/WlQXsWBpLLNgCYNNwF+mdE0PcZvYiFa+p8rm3HiUSDGSQnLv
         uLzdwgyZYqTSzaGt8PHoapXTekenmBdTQKiKrd3lxtRDSHxKqWxDspsJLqjaBYiIXn7p
         HGjUnw1BrR0K22E/fvdMkXh3s+iTBIJtFp3IK4vQx23uEdSAx9oL0/vFHinZN5fR/fCA
         P04Q==
X-Forwarded-Encrypted: i=1; AHgh+RqKG9cjr0a13J2QfXKQ0hux9e6h04znu8y6cW+oP7h2n0l6SOo9+10TYG3fOiDXi3NgDy/LdCBJYMn0gA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw44f8KxG1hwwvI2ZyjJeEDcSSl3F2bsJkpsYfMSHSfdyHJ4LII
	Q6SDYYcrLYjauAmFkF1kEos773QCUxamcajPixks3uo9gMbrmTFiAkSMN3n3otrciL2xmFyk2yh
	hlxG2FQyGG62KS1HH0lYss9BusYzH1BAkvjn+cqSe2voCV0TZ7v1vXTrP2gekpBwAQA==
X-Gm-Gg: AfdE7clEVMKY5/AQOKes4Ou3HsajH6t7WEDMQGczUk56z0vGn7E7Btfw1JPY8cIA0RI
	P+xbhG0uzuRpIZz5VfEH4sjFzhxZDCKCw7++eCxnnJc2/pWa81J5bFl5iqQIyvOv/NQ7Z/7PLGl
	HVij9lgyd1BUMnUtE+RZl1029/hxsFxd5E6MpzLUAMxBDVL9h7BjIm0UmrmvJISWy8BRdDO6anP
	9SowG3NJiW4lCN1u/AThrmNDkmjobbQeXLQZTogQ/IKU8n7WBnLGvfH/aC4F+fD9QrUqiqdi5r7
	kSpo1PvQxmzIU8IHmuRv4FeC5ibkxhscGIQAsN3bAAgddlgo0D9Hm6dMb4Y+WjRwNE0BfP0ZQIp
	AzTrZ46ygHgAtf4w9tvWPYWuu4AlwpJpKeR4=
X-Received: by 2002:a05:620a:454a:b0:92e:5ef1:9072 with SMTP id af79cd13be357-92ed77c7d64mr698107285a.2.1783692249863;
        Fri, 10 Jul 2026 07:04:09 -0700 (PDT)
X-Received: by 2002:a05:620a:454a:b0:92e:5ef1:9072 with SMTP id af79cd13be357-92ed77c7d64mr698087085a.2.1783692247367;
        Fri, 10 Jul 2026 07:04:07 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15de6c565fsm311138366b.2.2026.07.10.07.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 07:04:06 -0700 (PDT)
Message-ID: <0acb2194-3894-4cdc-8f74-a88ec3670d4e@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 16:04:03 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: milos: add OSM L3 node
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
 <20260710-milos-cpu-opp-v1-2-ae7f4b09bc77@fairphone.com>
 <bf766035-54fa-4e98-8abe-22cf0a229ffa@oss.qualcomm.com>
 <DJUY0I0R3DGG.1YC9D7H4AAI0J@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DJUY0I0R3DGG.1YC9D7H4AAI0J@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a50fbda cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=_B_-jDzFwVDfZiktVnwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE0MCBTYWx0ZWRfX6Y1Uu5jCwMiE
 HlfSkGfcFlK5sPcWDbOtB9mov4ddxb+MsWq97CWp6nAjA+JBLWvpN34QHqCLbYFQ3/Ztx0lSXD1
 Yo+z+GBDzApE+ZZ15kqytKDnA39w8/ocuEQQYfJrvGMkgt27DW480ejqgyMnKVCWzSYT4/3lnyD
 7Ua2LMvHKK41W727NutAWNEC0riE77q6drz65MZuhor84fpolP/N626RlzSYol68zFOAt9GIFsl
 RCsYk4ewQ6klIsd9GT1/vcTDF82/VxhwspZkqvJnCEVSpDa3iWHGOtqQV/sH2MXjZ8f8i/EryMJ
 eDVWl80miP18yhmkZ8FmjHzL93jCs9F3yqolUpQX+TBd+XAtJgGkTPd5aMHqPkL2F6+yuPHCK0H
 Tr4rvtCvHLYf9yDDvAsixX5S5W3ibf+kHOUZpW2m6C5oz5VP7QuSC2zq740VnluXnvn8UnLbo1l
 +m5JYlJe0zBNYhzqwsw==
X-Proofpoint-ORIG-GUID: Sw12hA1DAjB5iS6hiyrpeWpc0s9OOGfS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE0MCBTYWx0ZWRfX6rdmam+GcN0u
 ty7AHJYSIqzdXLLNYu5Ol/IVvyiC4lyhKNWhTIjruhSXeXsRYC+SYj8nex8fuYXaUNIm7D17XX7
 ukeEK8Y9RJwFcDA1LSixPhh4w6cwAXc=
X-Proofpoint-GUID: Sw12hA1DAjB5iS6hiyrpeWpc0s9OOGfS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100140

On 7/10/26 3:58 PM, Luca Weiss wrote:
> Hi Konrad,
> 
> On Fri Jul 10, 2026 at 3:44 PM CEST, Konrad Dybcio wrote:
>> On 7/10/26 11:22 AM, Luca Weiss wrote:
>>> Add the OSC L3 Cache controller node.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>
>> I'd suggest to squash this series into 1 big patch, without patch
>> 3 applied the OSM driver will engage and perform sync_state (with
>> 0 requests, so it will vote for 0/lowest) and the system
>> performance will be tragic
> 
> Fair point I think, I took the structure of the patches from sm8650
> which had it split this way but yes, it doesn't make too much sense in
> terms of keeping system performance alive through bisection.

Please carry my 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

for the squashed patch 

Konrad
