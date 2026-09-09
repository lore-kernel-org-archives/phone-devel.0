Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3879055C337
	for <phone-devel@vger.kernel.org>; Wed,  9 Sep 2026 13:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959800; cv=none; b=imdRZ34534MXmTqMaTfGPWzY/x7MSvVZKAbzB898puq5lpfJOu0Bgs9hHuXHzfDg6R0NgPKxGQzZeTXcONdCTId3sPxk5OVoTTez2c3HTdYJ9VzCcIFNsUWhpIRK28VUaQtb4cMDhp6c0sYFtFCWEEbUW6lo6pjnwvp4g394ILg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959800; c=relaxed/simple;
	bh=iXyqVSWvmcW331rAsdNhFo+83AVBlrw5mw/55ZewwM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SiYRkqadBtJIf+m17fIjNl3ROI63lj+728/tOm0dUgifV7GzPyBscu1+flWeIOtK+YGhiquuZOnpTvBjw0DdmNLJR+CZ51n5P2+VDhVySp20kJARyqFkRvRaMk2I7MjuxQgsZC/3nxqZsMNverFT+eCmdTOMffyqY667L2jVvb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JsFEBh9t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RybqNIPq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JsFEBh9t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RybqNIPq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CCod91401027
	for <phone-devel@vger.kernel.org>; Wed, 9 Sep 2026 13:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9O/ZCwMRsoEO1n+0T3o5T+zX4t0ZK8Ed1UCC5oqjrI=; b=JsFEBh9t1JX/nXmN
	5VuC1+yMKMrqmIlfarexpHaROym84F9Dsg7+UelBOay5JJFkHbgArMeHxhRvGiNF
	phK/vdWXHnPRHW5kZi0cAovhgqNi0zIktY160VDTLV1iz6zLI9027ewPhncNQ49i
	tVwiC+EufIqHQNx2oL+9eZdOyEpqcJtFz37kGUWpVAlpkasGWYWejMzMYIyZ4n2+
	0tPJIeCx+YRgbPYQDRr270x/qwC0VHfIIuulf3ewVKv2+UYRm2ntMxGCL+CPN5ff
	8Mf1cBTHFDTPlwiLWXYTv2vIs6Pz1CYlGYSeSOhV+G5zRxC3+4orlOMTDAOVl9c5
	FJ5Yww==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk78x07q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 09 Sep 2026 13:16:36 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c66ec39d8cso139482e0c.0
        for <phone-devel@vger.kernel.org>; Wed, 09 Sep 2026 06:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788959796; x=1789564596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9O/ZCwMRsoEO1n+0T3o5T+zX4t0ZK8Ed1UCC5oqjrI=;
        b=RybqNIPqhuBqGZOEXP4WRBIIyF3ifrib03AEt78stYtw7KQJ6580gYPg1ZpWMV6UDq
         DdOXC1/iHsSQye+F1zgt9Ss8ENNOYoSyf+jIT9J5RQSskw5aW8KrQBGEEtseqpf5NCeC
         LvB9F/3wKSiLbUuEutX33AMz46w/lxTeSxQgmiYdX8SWsBIV20GPv8N6tgd+IySNu1RU
         FAv0TwkqTJc40LkQEIcmREaM5c5KNBl8y3JCJHp80KS/jJKgXXhgeuKuRWieN+dn2Kh3
         v0FtlhRV1OtUpYeGP0/kNh6LmUFirIdmtt6sEYxIHjJ6Mu+UaPa+sqeIpgOLtkQQbxeq
         XOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959796; x=1789564596;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H9O/ZCwMRsoEO1n+0T3o5T+zX4t0ZK8Ed1UCC5oqjrI=;
        b=I2vsynGj0JbKoNtC6Tok22Ckb1jVhiVA/LyqbX+KqMbIfAkeGuGiIo84jPZJP/0Jzq
         dqdvLMW4JugjL3XCATB9VceiWO1PuSZpZKUP8emeHjJHUX0E+3pyMYH0CaIExmiVk6Ag
         CGvtLVHXzKjFWr4YsY5W1nLhlKN0fbujEGC1pWAoRDHVckaXobGxgbVMEBmiNLukV+hO
         s+131s0tcrs+daAmGtXmWL61uMWEZy8ObFMT5aAM8yg503swkth4219aJdBlnUWXD4Gk
         Bwu/oVlFB5wOxSp0T66Sy+OYcyIkGVBQwRyZZIEmvFI+vVBcvK2W0xieRMHWmVExuhhW
         bRgA==
X-Forwarded-Encrypted: i=1; AKwUvBxxpZB8nPumEBVxGFnvEARWaA01mFutcJ8hry5g5hW7jkTeK9ZymqhP4q83VdgzifYK4i8Xl7FV/egoCA==@vger.kernel.org
X-Gm-Message-State: AFuF++kl0vKw0eOd8q3qOdDKYvu5FmVLjpdsx4eZoQOUyzoQKE0JQXO3
	NPZK0hDdU0gIV73qldg1tCAVujTRhULHT54kjxeWc7g/tTE1QtGvlyhKYoRgo03hpjiLSth8/Mf
	/XC5+NUp64Y7VaNa7QW8lpiAH3J1BlVKxMtksMoHxzYohftedRtmuSGDaioEUsL/a9A==
X-Gm-Gg: AYBFou1O3xhEalOZxuGd3ck9pzzu8ayhgYO4JcTHYFZYbp84bu/3y2XzcvAjsXK9sxX
	PbaM5TcCUyM8/bu27Yx/+fvfJaFHCr3mTxLgUCTBogS7nRPEdxARqsdAlFitQbbdcfpEqvoG/TK
	MWh2yG30u6fST3UDA7n26xdua+/RLHUqKr+poThZ+H7tEvLwBW7q3/z9+oGbTN+TYCkb8vzTo/6
	55YKf5LL+BrBlg4M6FYZFb2tBPLpKrprDc2t8Xq3pRNnrejHEoLqMIJlN4n8S8JzyFEdsqNhXpi
	5DLk6juHDj+c/A7I5La6+vFG14aYeWC9S2dRC4YDvh+fJEp4S9czDqdrKHRzl8+1qwpF47VUwgE
	ERcWO+eU2VR5oDgRuE+sRoQ==
X-Received: by 2002:a05:6122:8118:b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c7fb9c4ce4mr4812500e0c.2.1788959795506;
        Wed, 09 Sep 2026 06:16:35 -0700 (PDT)
X-Received: by 2002:a05:6122:8118:b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c7fb9c4ce4mr4812434e0c.2.1788959794996;
        Wed, 09 Sep 2026 06:16:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b74d55a4absm3280227e87.50.2026.09.09.06.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:16:33 -0700 (PDT)
Message-ID: <062d0fc6-dcae-4636-ae95-c8144317f0ff@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 15:16:30 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-lg: Enable NFC
To: David Heidelberg <david@ixit.cz>, Paul Sajna
 <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260906-sdm845-lg-judy-nfc-v2-1-63aeb7b1a5f6@postmarketos.org>
 <28fb606b-8631-483a-a02e-ecd16e9cc238@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <28fb606b-8631-483a-a02e-ecd16e9cc238@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0PVfpcdxN7FISCDi7nAvf8meA9F0wLZq
X-Proofpoint-GUID: 0PVfpcdxN7FISCDi7nAvf8meA9F0wLZq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0OSBTYWx0ZWRfXyoDy4NO+ssHy
 qMTXSLqAYJLhU9o8Mk3obfubCstEsZXOiOox8WKWkoKEJJlwzSckdDrUKCL9ujk6IWOqf8dqfXV
 TWN3BG8x18yRAEzF+9O7n31dc397d0s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0OSBTYWx0ZWRfX7wBgrlJGJ57/
 lLjbGguTefKVxKqXpjYz6lIXfxsgx1TcEqojwnBQtqBJilpX6RLWg5KJYs7Lh9bBpZYWN0NS++d
 J3XEYMsbu2vfl8Ipk0ZIfOIn0WHxIiAZj7+CAh1pQOxvOgEi3GZcLp7xnq/GwP4O3nwQd3hASdB
 Ex/UlUAkekqLlhesGbQZY5NMUcwvLfI23r2kNqSfLqvTPcDs45p7gXUmKZ2jJiBXRRRpVhE5q9y
 kV5YXw133WLqw6NH26bDXE+cQ0fAptrLiqicd5MWBHwo6xP42Jk32mHGw/VEubcPEZ8QDULXOY/
 QR/SPzschKN+MmQwj/j6xtRCEBnHZBFk986wpKxWVM2PXS7T7i6UEtopVgHb+hnGmYnDPNfyhtk
 OQym9Rh6MBXifCJJIO7yR8Ou5vEuvusBtyAXTU7t2Pr2wM9KosjZXMSUl5APDvz5i7guBVPi/Q7
 mQlz9C95cPbDpuT7EtA==
X-Authority-Analysis: v=2.4 cv=SvWgLvO0 c=1 sm=1 tr=0 ts=6aa15c34 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=OQN141zOAAAA:20 a=Gbw9aFdXAAAA:8 a=DKkjQw_Nfd4kA1BEE-cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22 a=9vIz8raoGPyDa4jBFAYH:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090149

On 9/6/26 11:32 PM, David Heidelberg wrote:
> On 06/09/2026 23:11, Paul Sajna wrote:
>> Add the i2c and tlmm nodes to support the NXP PN547 NFC chip
>>
>> Downstream dtsi for reference:
>> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-judyln_lao_com/sdm845-judyln_lao_com-nfc.dtsi
>>
>> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
>> ---

[...]

>> +    nfc_default: nfc-default-state {
>> +        pins = "gpio12", "gpio62", "gpio63", "gpio116";
> 
> here the verbosity may not be bad (device-tree functions as documentation too)
> gpio116 is associated with eSE NFC part (just guessing, but... it worked before, so), and generally the pn547 doesn't need it at all to work.
> 
> TBH not sure if there or what consensus is here about this. The eSE needs it, but we don't have the driver thus also no integration with NFC part.

The eSE driver would still be acting on the NFC node, right?

Konrad
